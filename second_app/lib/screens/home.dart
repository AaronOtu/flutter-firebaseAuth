import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:second_app/screens/signin.dart";

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          FirebaseAuth.instance.signOut().then((value) {
          // ignore: use_build_context_synchronously
          Navigator.push(context, MaterialPageRoute(builder:(context){return const SignIn();},
            ),
          );
            
          });
        }, child: const Text("Logout"))
      ),

    );
  }
}