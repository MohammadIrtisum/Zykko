
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:image_picker/image_picker.dart";
import "package:meassage_app/resources/auth_mathod.dart";
import "package:meassage_app/utils/colors.dart";
import "package:meassage_app/utils/utils.dart";
import "package:meassage_app/widgets/text_field_input.dart";

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});
  

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioCotroller = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bioCotroller.dispose();
    _usernameController.dispose();
    super.dispose();
  }

   void  selectImage() async{
    Uint8List im = await pickImage(ImageSource.gallery);
      setState(() {
        _image = im;
     });
   }    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
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
            Stack(
              
              children: [ 
                _image !=null? CircleAvatar(
                  radius: 63,
                  backgroundImage: MemoryImage(_image!),
                ):CircleAvatar(
                  radius: 63,
                  backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.a9qb_VLfFjvlrDfc-iNLpgHaHa?w=187&h=188&c=7&r=0&o=7&pid=1.7&rm=3")
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(onPressed: selectImage, icon: const Icon(Icons.add_a_photo)))
              ],
            ),
            const SizedBox(height: 23,),
            TextFieldInput(textEditingController: _usernameController, textInputType: TextInputType.text, hintText: "Enter your username", isPass: false),
            const SizedBox(height: 23,),
            TextFieldInput(textEditingController: _emailController, textInputType: TextInputType.text, hintText: "Enter your email", isPass: false),
            const SizedBox(height: 23,),
            TextFieldInput(textEditingController: _passwordController, textInputType: TextInputType.text, hintText: "Enter your password", isPass: true),
            const SizedBox(height: 23,),
            //TextFieldInput(textEditingController: _bioCotroller, textInputType: TextInputType.text, hintText: "Enter your bio", isPass: false),
            const SizedBox(height: 23,),
            InkWell(
              onTap: () async{
                String res = await AuthMathod().singUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                  file: _image!,
                );
                print(res);
              },
              child: Container(
                child: const Text("Sing up"),
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
                  child: const Text ("Have an account?"),
                  padding: EdgeInsets.symmetric(vertical: 9.0),),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    child: Text("Log in",
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