import 'package:flutter/material.dart';
import 'package:meassage_app/utils/dimension.dart';
class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayoutScreen({super.key , required this.webScreenLayout, required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > webScreenSize) {
        // web screen
        return webScreenLayout;
      } 
      // mobile screen
      return mobileScreenLayout;
    });
  }
}