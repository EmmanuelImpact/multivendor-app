import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './views/customer_signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import './views/customer_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  await Firebase.initializeApp().then((value) {
    // ignore: avoid_print
    print(
      'Successfully connected to firebase.',
    );
  });
  runApp(
    const MultiVendorApp(),
  );
}

class MultiVendorApp extends StatelessWidget {
  const MultiVendorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: const TextStyle(
                color: Colors.cyan,
              ),
            ),
      ),
      title: 'MultiVendorApp',

      home: const CustomerHomeScreen(),
      //routes: {},
    );
  }
}
