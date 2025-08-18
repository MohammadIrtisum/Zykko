import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:meassage_app/utils/colors.dart";
import "package:meassage_app/widgets/text_field_input.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: Container(), flex: 2),
            SvgPicture.asset("assets/ic_instagram.svg",
              color  : primaryColor ,
              height: 64,),

            const SizedBox(height: 59,),
            TextFieldInput(textEditingController: _emailController, textInputType: TextInputType.text, hintText: "Enter your email", isPass: false),
            const SizedBox(height: 23,),
            TextFieldInput(textEditingController: _passwordController, textInputType: TextInputType.text, hintText: "Enter your password", isPass: true),
            const SizedBox(height: 23,),
            InkWell(
              child: Container(
                child: const Text("Log in"),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                color: blueColor
                ),
                
              ),
            ),
            const SizedBox(height: 13,),
            Flexible(child: Container(), flex: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text ("Don't have an account?"),
                  padding: EdgeInsets.symmetric(vertical: 9.0),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Container(
                    child: Text("Sign Up",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                    padding: const EdgeInsets.symmetric(vertical: 9.0),
                  
                  ),
                )
                
                // const Text("Don't have an account?"),
                // Padding(padding: const EdgeInsets.symmetric(vertical: 9)),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushNamed(context, '/signup');
                //   },
                //   child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
                // )          
              ],
            )
          ],
        ),
      )),
    );
  }
}