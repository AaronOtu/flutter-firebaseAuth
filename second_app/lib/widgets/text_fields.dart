import 'package:flutter/material.dart';

TextField reusableTextField(
    String text, 
    IconData icon, 
    bool isPasswordType, 
    TextEditingController controller) {
      
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    style: TextStyle(color: Colors.black.withOpacity(0.9)),  // Darker text for contrast
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black54,  // Darker icon color
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.black54.withOpacity(0.9)),  // Darker label text color
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.grey.withOpacity(0.1),  // Light grey background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}
