import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Uihelper {
  static customTextField( {required TextEditingController controller, required String text, required bool inhide , required TextInputType textInputType }) {
    return Container(
      height: 49,
      width: 343,
      decoration: BoxDecoration(
        color: Color(0xFF121212),
        // border: Border.all( color:  Color(0xFFFFFFFF)),
        borderRadius: BorderRadius.circular(5),
        border: Border.all( 
          color: Colors.white24,
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left:15),
        child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle( 
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color : Color(0xFFFFFFFF),
          ),
            border:InputBorder.none,
        ),
        obscureText: inhide,
        keyboardType: textInputType,
            ),
      ),
    );
  }
  
  static CustomImage({required String imgUrl}){
    return Image.asset('assets/images/$imgUrl');
  }

  static CustomTextButton({required String text, required VoidCallback callback})
  {
    return TextButton(
      onPressed: (){
        callback();

      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.normal,
          color: Color(0xFF3797EF),
        ),
      )
    );
  }

  static CustomButton({required String buttonName, required VoidCallback callback}){
    return SizedBox(
      height: 43,
      width: 343,
      child: ElevatedButton(onPressed: () {
        callback();
      }, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff3797EF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Center(
        child: Text(buttonName, style: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),),
      )),
    );
  }
}
