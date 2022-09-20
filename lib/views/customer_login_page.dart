import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../views/customer_signup_page.dart';
import '../views/customer_home_screen.dart';
import '../controllers/auth/snackbar_error_message.dart';
import '../controllers/auth/auth_controller.dart';

class CustomerLoginPage extends StatefulWidget {
  const CustomerLoginPage({Key? key}) : super(key: key);

  @override
  State<CustomerLoginPage> createState() => _CustomerLoginPageState();
}

class _CustomerLoginPageState extends State<CustomerLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SnackErrorMessage _errorMessage = SnackErrorMessage();
  final AuthController _auth = AuthController();
  var _isLoading = false;

  bool _textObscurity = true;

//Method For Logging In Customer
  _logInMethod() async {
    setState(() {
      _isLoading = true;
    });
    String res = await _auth.logInMethod(
      _emailController.text,
      _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'successful') {
      // ignore: use_build_context_synchronously
      return _errorMessage.snackError(context, res);
    } else {
      // ignore: use_build_context_synchronously
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return const CustomerHomeScreen();
          },
        ),
      );
    }
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
                      'LogIn to Customer\'s Account',
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
                const SizedBox(
                  height: 15,
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
                  onSubmitted: (_) => _logInMethod(),
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
                      )),
                  controller: _passwordController,
                  onSubmitted: (_) {
                    _logInMethod();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // ignore: sized_box_for_whitespace
                GestureDetector(
                  onTap: _logInMethod,
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
                          )
                        : const Text(
                            'LogIn',
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
                      'Don\'t have an Account?',
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
                              return const CustomerSignUpPage();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'SignUp',
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
