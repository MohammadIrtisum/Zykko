import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meassage_app/Screen/Login/login-screen.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgUrl: "logo.png"),
            SizedBox(height: 29,),
            Uihelper.customTextField(controller: emailController, text: "Email", inhide: false, textInputType: TextInputType.emailAddress),
            SizedBox(height: 11,),
            Uihelper.customTextField(controller: passwordController, text: "Password", inhide: true, textInputType: TextInputType.visiblePassword),
             SizedBox(height: 11,),
            Uihelper.customTextField(controller: userNameController, text: "Username", inhide: false, textInputType: TextInputType.text),
             SizedBox(height: 19,),
            Uihelper.CustomButton(buttonName: "Sign up", callback: (){}),
            SizedBox(height: 29,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style:
                TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ) ,),
                Uihelper.CustomTextButton(text: "Log in ", callback: () {
                  Navigator.pushReplacement(context, 
                   MaterialPageRoute(builder: (context) => LoginScreen())
                  );
                })
                // TextButton(
                //   onPressed: (){},
                //   child: Text("Login", style: TextStyle(
                //     fontSize: 13,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.blue,
                //   ),),
                // )
              ],
            )


          ],
        ),
      ),
    );
  }
}