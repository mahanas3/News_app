import 'package:flutter/material.dart';

class Custom_textfield extends StatelessWidget {
  Custom_textfield(
      {super.key,
        required this.text1,
        required this.text2,
        required this.icon,
        required this.controller,
        required this.validator});

  String text1;

  String text2;

  Widget icon;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintText: text1,
          labelText: text2,
          hintStyle: const TextStyle(color: Colors.black87),
          prefixIcon: icon,
          prefixIconColor: Colors.black87,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          filled: true,
          fillColor: Colors.white60.withOpacity(1)),
      style: const TextStyle(),
    );
  }
}
