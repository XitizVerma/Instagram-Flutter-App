import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/utils/image_links.dart';
import 'package:instagram_flutter_app/utils/utils.dart';

class ProfilePostScreen extends StatelessWidget {
  var images = ImageLinks.getImages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: true,
        itemBuilder: (context, index) {
          var randomNumber = Utils.generateRandomInt(48);
          return Container(
            clipBehavior: Clip.antiAlias,
            height: 124,
            width: 124,
            decoration: BoxDecoration(),
            child: CachedNetworkImage(
              imageUrl: images[randomNumber]["img"],
              fit: BoxFit.cover,
              placeholder:
                  (context, url) =>
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
              errorWidget:
                  (context, url, error) => Center(
                    child: Text(
                      images[randomNumber]["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
