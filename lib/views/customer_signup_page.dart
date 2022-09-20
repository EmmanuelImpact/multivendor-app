import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../views/customer_login_page.dart';
import '../controllers/auth/snackbar_error_message.dart';
import '../controllers/auth/auth_controller.dart';

class CustomerSignUpPage extends StatefulWidget {
  const CustomerSignUpPage({Key? key}) : super(key: key);

  @override
  State<CustomerSignUpPage> createState() => _CustomerSignUpPageState();
}

class _CustomerSignUpPageState extends State<CustomerSignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _auth = AuthController();
  final SnackErrorMessage _errorMessage = SnackErrorMessage();

  var _textObscurity = true;
  var _isLoading = false;
  Uint8List? _image;

  //Customer's SignUp Method
  _signUp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await _auth.sigUpMethod(
      _emailController.text,
      _passwordController.text,
      _fullNameController.text,
      _image,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'successful') {
      // ignore: use_build_context_synchronously
      return _errorMessage.snackError(context, res);
    } else {
      // ignore: use_build_context_synchronously
      return Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return const CustomerLoginPage();
      }));
    }
  }

  //Method For Picking Image From camera
  _pickImageFromcamera() async {
    Uint8List image = await _auth.pickImageGenerically(
      ImageSource.camera,
    );

    setState(() {
      _image = image;
    });
  }

  //Method For Picking Image From Gallery
  _pickImageFromGallery() async {
    Uint8List image = await _auth.pickImageGenerically(
      ImageSource.gallery,
    );

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Create Customer\'s Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ],
                ),
                Row(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.cyan,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 48,
                            backgroundColor: Colors.cyan,
                          ),
                    const SizedBox(
                      width: 20,
                    ),
                    // ignore: sized_box_for_whitespace
                    Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: _pickImageFromcamera,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            onPressed: _pickImageFromGallery,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _fullNameController,
                  onSubmitted: (_) => _signUp(),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _emailController,
                  onSubmitted: (_) => _signUp(),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: _textObscurity,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: _textObscurity
                          ? const Icon(
                              Icons.visibility,
                              size: 30,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              size: 30,
                            ),
                      onPressed: () {
                        setState(() {
                          _textObscurity = !_textObscurity;
                        });
                      },
                    ),
                  ),
                  controller: _passwordController,
                  onSubmitted: (_) {
                    _signUp();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // ignore: sized_box_for_whitespace
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    alignment: Alignment.center,
                    height: 45,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _isLoading
                        ? const CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 15,
                          )
                        : const Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an Account?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const CustomerLoginPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'LogIn',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Or',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create a seller\'s Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
