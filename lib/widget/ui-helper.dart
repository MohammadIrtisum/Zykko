import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Uihelper {
  static Widget customTextField({
    required TextEditingController controller,
    required String text,
    required bool inhide,
    required TextInputType textInputType,
    String? errorText,
    ValueChanged<String>? onChanged,
    // String? Function(String?)? validator,
    //bool showError = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 49,
          width: 343,
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.white24),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFFFFFFF),
                ),
                contentPadding: const EdgeInsets.all(15),
                border: InputBorder.none,
                // Remove errorText from here
              ),
              obscureText: inhide,
              keyboardType: textInputType,
              onChanged: onChanged,
              
            ),
          ),
        ),
        if (errorText != null )
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Text(
              errorText,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  static Widget CustomImage({required String imgUrl}) {
    return Image.asset('assets/images/$imgUrl');
  }

  static Widget CustomTextButton({
    required String text,
    required VoidCallback callback,
  }) {
    return TextButton(
      onPressed: () {
        callback();
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Color(0xFF3797EF),
        ),
      ),
    );
  }

  static Widget CustomButton({
    required String buttonName,
    VoidCallback? callback, // Changed to nullable VoidCallback
  }) {
    return SizedBox(
      height: 43,
      width: 343,
      child: ElevatedButton(
        onPressed: callback, // Use callback directly, null disables the button
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3797EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  static void mySnackbar({
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}