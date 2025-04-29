import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/services/download_service.dart';
import 'package:instagram_flutter_app/utils/utils.dart';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final TextEditingController downloadController = TextEditingController();

  double downloadProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: Utils.getScreenWidth(context) * 0.9,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white60, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Download",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.cloud_download_outlined, size: 30),
                    ],
                  ),

                  SizedBox(height: 20),

                  UIHelper.customTextField(
                    controller: downloadController,
                    text: "Paste Link",
                    toHide: false,
                    width: Utils.getScreenWidth(context) * 0.8,
                    borderRadius: 5,
                  ),

                  SizedBox(height: 20),

                  UIHelper.customButton(
                    text: "Download",
                    width: Utils.getScreenWidth(context) * 0.8,
                    callback: () {
                      FileDownloadService.downloadFile(
                        context: context,
                        url: downloadController.text,
                        onProgressUpdate: (double progress) {
                          setState(() {
                            downloadProgress = progress;
                          });
                        },
                      );
                    },
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Download Progress: ${(downloadProgress * 100).toStringAsFixed(2)} %",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: Utils.getScreenWidth(context) * 0.8,
                    child: LinearProgressIndicator(
                      value: downloadProgress,
                      minHeight: 5,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0XFF3797EF),
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
