import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/navbar/bottom_navigation_bar.dart';
import 'package:instagram_flutter_app/widgets/image_links.dart';
import 'package:instagram_flutter_app/widgets/message_links.dart';

class MessageScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  var messages = MessageLinks.getMessages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 88,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
        }, icon: Icon(CupertinoIcons.back)),
        title: Text("its_me_xitiz"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.plus))
        ],
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              height: 40,
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
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context,index) {
              return ListTile(
                leading: UIHelper.customImage(imageUrl: messages[index]["img"].toString()),
                title: Text(messages[index]["name"], style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                subtitle: Text(messages[index]["text"]),
                trailing: Icon(Icons.camera_alt_outlined),
              );
            },itemCount: messages.length,
            ),
          )
        ],
      )
    );
  }
}