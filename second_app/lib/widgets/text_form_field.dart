import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  MyFormPageState createState() => MyFormPageState();
}

class MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reusable TextField Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              reusableTextField(
                  'Enter Text', 
                  Icons.text_fields, 
                  false, 
                  _controller),
              const SizedBox(height: 20),
            
            ],
          ),
        ),
      ),
    );
  }
}



TextFormField reusableTextField(
  String text, 
  IconData icon, 
  bool isPasswordType,
  TextEditingController controller) {
    
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a value';
      }
      return null;
    },
    autocorrect: !isPasswordType,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black54,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
