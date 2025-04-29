import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';

class DownloadScreen extends StatelessWidget {
  TextEditingController downloadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Downl
          Icon(Icons.cloud_download_outlined, size: 50,)
        ]),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.customTextField(
              controller: downloadController,
              text: "Paste Link",
              toHide: false,
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UIHelper.customButton(text: "Download", callback: () {})],
        ),
      ],
    );
  }
}
