import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meassage_app/Screen/bottomNav/heart/heart-screen.dart';
import 'package:meassage_app/Screen/bottomNav/home/home-screen.dart';
import 'package:meassage_app/Screen/bottomNav/post/post-screen.dart';
import 'package:meassage_app/Screen/bottomNav/profile/profile-screen.dart';
import 'package:meassage_app/Screen/bottomNav/search/search-screen.dart';
import 'package:meassage_app/widget/ui-helper.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int currentIndex = 0;
  List<Widget> pages = [
    homeScreen(),
    searchScreen(),
    postScreen(),
    heartScreen(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
        // BottomNavigationBarItem(icon: Uihelper.CustomImage(imgUrl: "Tab 1.png"),label:"Home"),
        // BottomNavigationBarItem(icon: Uihelper.CustomImage(imgUrl: "Tab 2.png"),label:"Search"),
        // BottomNavigationBarItem(icon: Uihelper.CustomImage(imgUrl: "Tab 3.png"),label:"Post"),
        // BottomNavigationBarItem(icon: Uihelper.CustomImage(imgUrl: "Tab 4.png"),label:"Heart"),
        // BottomNavigationBarItem(icon: Uihelper.CustomImage(imgUrl: "Tab 5.png"),label:"Pofile"),
        
        BottomNavigationBarItem(icon: Icon(Icons.home,), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon( CupertinoIcons.plus_app), label: "Post"),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: "Heart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],),
      body: IndexedStack(
        children: pages,
        index: currentIndex,
      ),
    );
  }
}