import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_app/screens/signup.dart';
import 'package:second_app/screens/test.dart';
import 'package:second_app/widgets/buttons.dart';
import 'package:second_app/widgets/text_fields.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage('images/signin.png')),
                  reusableTextField(
                    "Enter Email",
                    Icons.person_outline,
                    false,
                    _emailTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 10),
                  signInSignUpButton(
                    context,
                    true,
                    () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              )
                              .then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const MyTest();
                                },
                              ),
                            );
                          });
                        } on FirebaseAuthException catch (e) {
                          setState(() {
                            if (e.code == 'user-not-found') {
                              _errorMessage = 'No user found for that email.';
                            } else if (e.code == 'wrong-password') {
                              _errorMessage = 'Incorrect password.';
                            } else {
                              _errorMessage = 'An error occurred. Please try again.';
                            }
                          });
                        }
                      }
                    },
                  ),
                  signUpOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Color.fromARGB(179, 17, 16, 16)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SignUp();
                },
              ),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 14, 13, 13),
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
