import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:second_app/screens/signup.dart";
import "package:second_app/screens/test.dart";
import "package:second_app/widgets/buttons.dart";
import "package:second_app/widgets/text_fields.dart";

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableTextField("Enter Email", Icons.person_outline, false,
                _emailTextController),
            const SizedBox(height: 20),
            reusableTextField("Enter Password", Icons.lock_outline, true,
                _passwordTextController),
            const SizedBox(height: 20),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                Navigator.push(
                  // ignore: use_build_context_synchronously
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MyTest();
                    },
                  ),
                );
              });
            }),
            signUpOption()
          ],
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
        )
      ],
    );
  }
}
