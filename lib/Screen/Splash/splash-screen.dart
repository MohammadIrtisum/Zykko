import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meassage_app/Screen/Login/login-screen.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Timer to move to LoginScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.CustomImage(imgUrl: "image 1.png"),
            const SizedBox(height: 19),
            Uihelper.CustomImage(imgUrl: "logo.png"),
          ],
        ),
      ),
    );
  }
}
