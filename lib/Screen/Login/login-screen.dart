import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meassage_app/Screen/signUp/sign_up.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgUrl: "image 1.png"),
            const SizedBox(height: 11,),
            Uihelper.customTextField(controller: emailController, text: "Email", inhide: false, textInputType: TextInputType.emailAddress),
            const SizedBox(height: 11,),
            Uihelper.customTextField(controller: passwordController, text: "Password", inhide: true, textInputType: TextInputType.visiblePassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Uihelper.CustomTextButton(text: "Forgot Password?", callback: (){})
              ],
            ),
            SizedBox(height: 9,),
            Uihelper.CustomButton(buttonName: "Log in", callback: () {}),
            SizedBox(height: 19,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomImage(imgUrl: "Icon.png"),
                Uihelper.CustomTextButton(text: "Log in with Facebook", callback: () {})
              ],
            ),
            SizedBox(height: 11,),
            Text("OR ", style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
            )),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?" , style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                ),
                Uihelper.CustomTextButton(text: "Sign up", callback: (){
                  Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => SignUp())
                  );
                })
              ],
            )
          ],
        ),
      ),
      
    );
  }
}