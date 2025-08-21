import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meassage_app/Screen/Login/login-screen.dart';
import 'package:meassage_app/resources/auth_mathod.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

final  TextEditingController _emailController = TextEditingController();
final  TextEditingController _passwordController = TextEditingController();
final  TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgUrl: "logo.png"),
            SizedBox(height: 29,),
            Uihelper.customTextField(controller: _emailController, text: "Email", inhide: false, textInputType: TextInputType.emailAddress),
            SizedBox(height: 11,),
            Uihelper.customTextField(controller: _passwordController, text: "Password", inhide: true, textInputType: TextInputType.visiblePassword),
             SizedBox(height: 11,),
            Uihelper.customTextField(controller: _userNameController, text: "Username", inhide: false, textInputType: TextInputType.text),
             SizedBox(height: 19,),
            Uihelper.CustomButton(buttonName: "Sign up", callback: () async {
               String res = await AuthMathod().singUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _userNameController.text,
                  // file: _image!,
                );
                print(res);
            }),
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