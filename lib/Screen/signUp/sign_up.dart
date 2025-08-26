import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meassage_app/Screen/Login/login-screen.dart';
import 'package:meassage_app/resources/auth_method.dart';
import 'package:meassage_app/resources/auth_provider.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class SignUp extends ConsumerWidget {
  SignUp({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(authFormProvider);
    final formNotifier = ref.read(authFormProvider.notifier);
    final authMethod = ref.read(authMethodProvider);

    emailController.addListener(() {
      formNotifier.updateEmail(emailController.text);
    });
    passwordController.addListener(() {
      formNotifier.updatePassword(passwordController.text);
    });
    userNameController.addListener(() {
      formNotifier.updateName(userNameController.text);
    });

    void signup() async {
      formNotifier.setLoading(true);
      String res = await authMethod.singUpUser(
        email: formState.email,
        password: formState.password,
        username: formState.name,
      );
      formNotifier.setLoading(false);
      if (res == "Success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        Uihelper.mySnackbar(
          message: "Sign up successful. Now turn on log in",
          context: context,
        );
      } else {
        Uihelper.mySnackbar(
          message: res,
          context: context,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Uihelper.CustomImage(imgUrl: "logo.png"),
              const SizedBox(height: 29),
              Uihelper.customTextField(
                controller: emailController,
                onChanged: (value) => formNotifier.updateEmail(value),
                text: "Email",
                inhide: false,
                textInputType: TextInputType.emailAddress,
                errorText: formState.emailError,
                // showError: formState.emailError != null,

              ),
              const SizedBox(height: 11),
              Uihelper.customTextField(
                controller: passwordController,
                onChanged: (value) => formNotifier.updatePassword(value),
                text: "Password",
                inhide: true,
                textInputType: TextInputType.visiblePassword,
                errorText: formState.passwordError,
              ),
              const SizedBox(height: 11),
              Uihelper.customTextField(
                controller: userNameController,
                onChanged: (value) => formNotifier.updateName(value),
                text: "Username",
                inhide: false,
                textInputType: TextInputType.text,
                errorText: formState.nameError,
              ),
              const SizedBox(height: 19),
              formState.isLoading? Center(child: CircularProgressIndicator(),) : Uihelper.CustomButton(
                buttonName: "Sign up",
                callback: signup,
              ),
              const SizedBox(height: 29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Uihelper.CustomTextButton(
                    text: "Log in",
                    callback: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}