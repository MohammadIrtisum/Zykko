import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meassage_app/Screen/Splash/splash-screen.dart';
import 'package:meassage_app/responsive/mobile_screen_layout.dart';
import 'package:meassage_app/responsive/responsive_layout_screen.dart';
import 'package:meassage_app/responsive/web_screen_layout.dart';
import 'package:meassage_app/utils/colors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta',
      debugShowCheckedModeBanner: false, 
      
      // theme: ThemeData(
       
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: Scaffold(
        body: SplashScreen(),
        //const ResponsiveLayoutScreen(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout())
      )
    );
  }
}