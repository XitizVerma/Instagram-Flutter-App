import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/heart/heart_screen.dart';
import 'package:instagram_flutter_app/screens/home/home_screen.dart';
import 'package:instagram_flutter_app/screens/mediapost/post_screen.dart';
import 'package:instagram_flutter_app/screens/profile/profile_screen.dart';
import 'package:instagram_flutter_app/screens/search/search_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBarScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    PostScreen(),
    HeartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: pages, index: currentIndex),
      bottomNavigationBar:
        Container(
          height: 100,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            backgroundColor: Colors.black,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.plus_app),
                label: "Upload",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                label: "Heart",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/profile.png",
                  width: 22,
                  height: 25,
                ),
                label: "Profile",
              ),
            ],
          ),
        )
    );
  }
}
