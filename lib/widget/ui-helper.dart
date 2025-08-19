import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Uihelper {
  static customTextField( {required TextEditingController controller, required String text, required bool inhide , required TextInputType textInputType }) {
    return Container(
      height: 43,
      width: 343,
      decoration: BoxDecoration(
        color: Color(0xFF121212),
        border: Border.all( color:  Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle( 
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color : Color(0xFFFFFFFF),
        ),
        // border:InputBorder.none,
      ),
      obscureText: inhide,
      keyboardType: textInputType,
    ),
    );
  }
  
  static CustomImage({required String imgUrl}){
    return Image.asset('assets/images/$imgUrl');
  }
}
