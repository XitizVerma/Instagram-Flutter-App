import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/mediapost/download_screen.dart';

import '../navbar/bottom_navigation_bar.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 88,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationBarScreen(),
              ),
            );
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("Media"),
        centerTitle: true,
      ),
      body: DownloadScreen(),
    );
  }
}
