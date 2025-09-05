import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meassage_app/Screen/bottomNav/bottom_nav.dart';
import 'package:meassage_app/Screen/signUp/sign_up.dart';
import 'package:meassage_app/resources/auth_method.dart';
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
            Uihelper.customTextField(controller: emailController, text: "Email", inhide: false, textInputType: TextInputType.emailAddress,),
            const SizedBox(height: 11,),
            Uihelper.customTextField(controller: passwordController, text: "Password", inhide: true, textInputType: TextInputType.visiblePassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Uihelper.CustomTextButton(text: "Forgot Password?", callback: (){})
              ],
            ),
            SizedBox(height: 9,),
            Uihelper.CustomButton(buttonName: "Log in", callback: () {
              AuthMethod().loginUser(
                email: emailController.text,
                password: passwordController.text,
              ).then((value) {
                if (value == "Success") {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNavScreen()));
                } else {
                  Uihelper.mySnackbar(
                    message: value,
                    context: context,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              });
            }),
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


// import 'package:flutter/material.dart';
// import 'package:meassage_app/Screen/signUp/sign_up.dart';
// import 'package:meassage_app/resources/auth_method.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formKey,
//         child: Center(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 120,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .9,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Login",
//                       style:
//                           TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
//                     ),
//                     const Text("Get started with your account"),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * .9,
//                         child: TextFormField(
//                           validator: (value) =>
//                               value!.isEmpty ? "Email cannot be empty." : null,
//                           controller: _emailController,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             label: Text("Email"),
//                           ),
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                         width: MediaQuery.of(context).size.width * .9,
//                         child: TextFormField(
//                           validator: (value) => value!.length < 8
//                               ? "Password should have atleast 8 characters."
//                               : null,
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             label: Text("Password"),
//                           ),
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width * .9,
//                         child: ElevatedButton(
//                             onPressed: () {
//                               if (formKey.currentState!.validate()) {
//                                 AuthService()
//                                     .loginWithEmail(_emailController.text,
//                                         _passwordController.text)
//                                     .then((value) {
//                                   if (value == "Login Successful") {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(
//                                             content: Text("Login Successful")));
//                                     Navigator.restorablePushNamedAndRemoveUntil(
//                                         context, "/home", (route) => false);
//                                   } else {
//                                     ScaffoldMessenger.of(context)
//                                         .showSnackBar(SnackBar(
//                                       content: Text(
//                                         value,
//                                         style: const TextStyle(
//                                             color: Colors.white),
//                                       ),
//                                       backgroundColor: Colors.red.shade400,
//                                     ));
//                                   }
//                                 });
//                               }
//                             },
//                             child: const Text(
//                               "Login",
//                               style: TextStyle(fontSize: 16),
//                             ))),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don't have and account?"),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) => SignupPage())
//                               );
//                             },
//                             child: const Text("Sign Up"))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }