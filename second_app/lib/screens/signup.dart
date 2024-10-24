// ignore_for_file: avoid_print, non_constant_identifier_names, avoid_types_as_parameter_names

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
  // Define the controllers for the text fields
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Corrected `extendBodyBehindAppBar`
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // leading: Icon(Icons.arrow_back), // Uncomment if you need the leading icon
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                reusableTextField(
                  "Enter Username",
                  Icons.person_outline,
                  false,
                  _userTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email",
                  Icons.email_outlined,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                        print("Account created successfully");
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyTest()));
                  }).onError((error, StackTrace) {
                    print("Error ${error.toString()} " );
                  });
                  
                }),
                // Uncomment the following line if you want to add the `signUpOption`:
                // signUpOption(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
