import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final bool isPass;
  const TextFieldInput({super.key, required this.textEditingController, required this.textInputType, required this.hintText, required this.isPass});

  @override
  Widget build(BuildContext context) {

    final InputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context)
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder,
        focusedBorder: InputBorder,
        enabledBorder: InputBorder,
        filled: true,
        // fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(9.0)
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}