import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/message/message_screen.dart';
import 'package:instagram_flutter_app/utils/constants.dart';

import '../../utils/image_links.dart';

class HomeScreen extends StatelessWidget {

  var storyImages = ImageLinks.getImages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 88,
        backgroundColor: Colors.black12,
        leading: Icon(Icons.camera_alt_outlined, size: 35),
        title: UIHelper.customImage(
          imageUrl: "instagram-logo-text.png",
          width: 160,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: UIHelper.customImage(
              imageUrl: "igtv2.png",
              height: 30,
              width: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen()),
              );
            },
            icon: UIHelper.customImage(
              imageUrl: "telegram-icon.png",
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 85,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          height:
                              66, // Slightly larger than avatar (2*radius + border thickness)
                          width:
                              66, // Slightly larger than avatar (2*radius + border thickness)
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.pink,
                                Colors.orange,
                                Colors.yellow,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3), // Border thickness
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Colors
                                        .black, // Background color between gradient and image
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2), // Inner padding
                                child: CircleAvatar(
                                  radius:
                                      25, // Original radius minus border thickness
                                  backgroundImage: NetworkImage(
                                    storyImages[index]["img"].toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          storyImages[index]["title"],
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),

          Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 54,
                    width: double.infinity,
                    color: Colors.black12,
                    child: ListTile(
                      leading: UIHelper.customImage(
                        imageUrl: "person/person3.png",
                      ),
                      title: Text(
                        Constants.SOUMYA_GARG,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0XFFF9F9F9),
                        ),
                      ),
                      subtitle: Text(
                        "Jaipur, Rajasthan",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0XFFF9F9F9),
                        ),
                      ),
                      trailing: Icon(Icons.more_horiz),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 375,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: UIHelper.customImage(imageUrl: "posts/jaipur.png"),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(CupertinoIcons.heart),
                      SizedBox(width: 20),
                      UIHelper.customImage(imageUrl: "comment.png"),
                      SizedBox(width: 20),
                      UIHelper.customImage(imageUrl: "telegram-icon.png"),
                      SizedBox(width: 230),
                      Icon(Icons.bookmark_border),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      UIHelper.customImage(
                        imageUrl: "person/person1.png",
                        width: 10,
                      ),
                      UIHelper.customImage(
                        imageUrl: "person/person4.png",
                        width: 10,
                      ),
                      SizedBox(width: 10),
                      Text("Liked by atisha_sharma and 6789 others"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                      Constants.SOUMYA_GARG,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Text("Jaipur Pink City Memories 2k25 🩷"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
