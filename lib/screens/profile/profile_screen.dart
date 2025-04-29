import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/profile/profile_post_screen.dart';
import 'package:instagram_flutter_app/screens/profile/tag_screen.dart';
import 'package:instagram_flutter_app/utils/constants.dart';
import 'package:instagram_flutter_app/utils/image_links.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var storyImages = ImageLinks.getImages();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 65),
              Icon(Icons.lock, size: 15),
              SizedBox(width: 5),
              Text(
                Constants.ITS_ME_XITIZ,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          centerTitle: true,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        ),
        body: Column(
          children: [
            // Fixed content up to TabBar
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (
                  BuildContext context,
                  bool innerBoxIsScrolled,
                ) {
                  return <Widget>[
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          // Profile Avatar and Stats Row
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distributes space evenly
                              children: [
                                // Profile Avatar
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: AssetImage(
                                    "assets/images/profile.png",
                                  ),
                                ),

                                // Stats Columns
                                _buildStatColumn("10", "Posts"),
                                _buildStatColumn("715", "Followers"),
                                _buildStatColumn("864", "Following"),
                              ],
                            )

                          ),

                          // Profile Description
                          Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    Constants.ITS_ME_XITIZ,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Software Developer 🤙🏻",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                    "Love for Bangalore skies 💙",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),

                              // Edit Profile Button
                              UIHelper.customButton(
                                text: "Edit Profile",
                                callback: () {},
                                backgroundColor: Colors.black,
                                width: 360,
                                height: 30,
                              ),
                              SizedBox(height: 20),

                              // Story Highlights
                              SizedBox(
                                height: 85,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 66,
                                              width: 66,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white10,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.black,
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(2),
                                                    child: CircleAvatar(
                                                      radius: 25,
                                                      backgroundImage: NetworkImage(
                                                        storyImages[index]["img"]
                                                            .toString(),
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
                                    itemCount: 4,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // TabBar as a pinned SliverAppBar to keep it fixed
                    SliverAppBar(
                      pinned: true,
                      toolbarHeight: 0,
                      bottom: TabBar(
                        indicatorColor: Colors.white,
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(
                            icon: Icon(
                              CupertinoIcons.square_grid_2x2,
                              size: 40,
                            ),
                          ),
                          Tab(icon: Icon(Icons.tag, size: 40)),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(children: [ProfilePostScreen(), TagScreen()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatColumn(String count, String label) {
  return Column(
    children: [
      Text(
        count,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}