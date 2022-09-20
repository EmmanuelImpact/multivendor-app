import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storageBucket = FirebaseStorage.instance;

  //Generic Method For Choosing Image

  pickImageGenerically(ImageSource source) async {
    final ImagePicker pickImage = ImagePicker();
    XFile? file = await pickImage.pickImage(source: source);
    if (file != null) {
      return file.readAsBytes();
    } else {
      // ignore: avoid_print
      print('You\'ve not picked an image.');
    }
  }

  imageurl(Uint8List? image) async {
    Reference ref = _storageBucket
        .ref()
        .child('profile pictures')
        .child('${_auth.currentUser!.uid}.jpg');

    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  sigUpMethod(
      String email, String password, String fullName, Uint8List? image) async {
    var res = 'Some errors occured.';
    try {
      if (email.isNotEmpty && password.isNotEmpty && image != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String downloadUrl = await imageurl(image);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'fullName': fullName,
          'email': email,
          'image_url': downloadUrl,
        });
        res = 'successful';
        // ignore: avoid_print
        print(_auth.currentUser!.email);
      } else {
        res = 'Fields cannot be empty';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  logInMethod(String email, String password) async {
    var res = 'Some errors occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'successful';
      } else {
        res = 'Fields cannot be empty.';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
