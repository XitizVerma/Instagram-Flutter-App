import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter_app/screens/navbar/bottom_navigation_bar.dart';
import 'package:instagram_flutter_app/utils/message_links.dart';
import 'package:instagram_flutter_app/utils/utils.dart';

class HeartScreen extends StatelessWidget {
  var images = MessageLinks.getMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavigationBarScreen(),
              ),
            );
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // New Notifications Section
          _buildNotificationSection(
            title: "New",
            notifications: [
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(13),
                action: "started following you",
                time: "Just now",
                icon: Icons.person_add,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "liked your photo",
                time: "2 min ago",
                icon: CupertinoIcons.heart_fill,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "mentioned you in a story",
                time: "5 min ago",
                icon: Icons.alternate_email,
              ),
            ],
          ),

          // Today Notifications Section
          _buildNotificationSection(
            title: "Today",
            notifications: [
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "commented on your post",
                time: "3 hours ago",
                icon: Icons.comment,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "liked your reel",
                time: "5 hours ago",
                icon: CupertinoIcons.play_circle_fill,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "started following you",
                time: "7 hours ago",
                icon: Icons.person_add_outlined,
              ),
            ],
          ),

          // This Week Notifications Section
          _buildNotificationSection(
            title: "This Week",
            notifications: [
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "liked your photo",
                time: "2 days ago",
                icon: CupertinoIcons.heart_fill,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "commented: \"Amazing shot!\"",
                time: "4 days ago",
                icon: Icons.chat_bubble_outline,
              ),
              _buildNotificationItem(
                context,
                index: Utils.generateRandomInt(10),
                action: "tagged you in a post",
                time: "6 days ago",
                icon: Icons.alternate_email,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build notification section
  Widget _buildNotificationSection({
    required String title,
    required List<Widget> notifications,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
        ),
        ...notifications,
      ],
    );
  }

  // Helper method to build individual notification item
  Widget _buildNotificationItem(
    BuildContext context, {
    required int index,
    required String action,
    required String time,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              "assets/images/${images[index]["img"]}",
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: images[index]["name"],
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(text: " $action"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
