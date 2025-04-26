import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_app/screens/test.dart';
import 'package:second_app/widgets/buttons.dart';
import 'package:second_app/widgets/text_fields.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatePassword(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'(?=.*[0-9])(?=.*[!@#$%^&*])').hasMatch(value)) {
      return 'Password must include a number and a symbol';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox( width: 30, height: 30 ,child: Image(image: AssetImage('images/signin.png'))),
                  reusableTextField(
                    "Enter Username",
                    Icons.person_outline,
                    false,
                    _userTextController,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Username is required' : null,
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Email",
                    Icons.email_outlined,
                    false,
                    _emailTextController,
                    validator: (value) =>
                        value != null ? validateEmail(value) : 'Email is required',
                  ),
                  const SizedBox(height: 20),
                  reusableTextField(
                    "Enter Password",
                    Icons.lock_outline,
                    true,
                    _passwordTextController,
                    validator: (value) =>
                        value != null ? validatePassword(value) : 'Password is required',
                  ),
                  const SizedBox(height: 20),
                  signInSignUpButton(context, false, () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyTest()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()} ");
                      });
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
