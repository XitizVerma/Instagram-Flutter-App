import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/widgets/image_links.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(width: 10),
              Container(
                height: 36,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  color: Color(0XFF262626),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0XFF8E8E93),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(width: 15),
              UIHelper.customImage(imageUrl: "live.png"),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      UIHelper.customImage(imageUrl: "igtv.png"),
                      SizedBox(width: 5),
                      Text(
                        "IGTV",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFF0F9F9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "Shop",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFF0F9F9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.linked_camera, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "Style",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFF0F9F9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.sports_handball, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "Sports",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFF0F9F9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 7),
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white24),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Icon(Icons.directions_car_rounded, size: 16),
                      SizedBox(width: 5),
                      Text(
                        "Auto",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0XFFF0F9F9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  height: 124,
                  width: 124,
                  decoration: BoxDecoration(),
                  child: Image.network(
                    ImageLinks.getImages()[index]["img"],
                    fit: BoxFit.cover,
                  ),
                );
              },
              itemCount: 24,
            ),
          ),
        ],
      ),
    );
  }
}
