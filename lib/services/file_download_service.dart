import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownloadService {
  static final Dio _dio = Dio();

  // Download and save high-resolution image
  static Future<void> downloadHighResImage({
    required BuildContext context,
    required String imageUrl,
    String? customFileName,
  }) async {
    try {
      if (await _requestPermission(Permission.storage)) {
        _showLoadingDialog(context);

        // Generate filename
        String fileName = customFileName ??
            'insta_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

        // Get the download directory
        Directory? downloadDirectory;
        if (Platform.isAndroid) {
          // For Android, use external storage
          downloadDirectory = Directory('/storage/emulated/0/Download');
        } else if (Platform.isIOS) {
          // For iOS, use documents directory
          downloadDirectory = await getApplicationDocumentsDirectory();
        }

        // Create full file path
        String filePath = '${downloadDirectory?.path}/$fileName';

        // Download the file
        await _dio.download(
          imageUrl,
          filePath,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
          onReceiveProgress: (received, total) {
            // You can implement progress tracking here
          },
        );

        // Save to gallery (works for both Android and iOS)
        final result = await ImageGallerySaver.saveFile(filePath);

        // Close loading dialog
        Navigator.of(context).pop();

        // Show success dialog
        _showSuccessDialog(context, filePath, result);

      } else {
        // Show permission denied dialog
        _showPermissionDeniedDialog(context);
      }
    } catch (e) {
      // Close loading dialog if still open
      Navigator.of(context).pop();

      // Show error dialog
      _showErrorDialog(context, e.toString());
    }
  }

  // Request storage permission
  static Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }

  // Loading Dialog
  static void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  // Success Dialog
  static void _showSuccessDialog(
      BuildContext context,
      String filePath,
      dynamic saveResult
      ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download Complete'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Image saved successfully'),
            SizedBox(height: 10),
            Text('Path: $filePath',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Error Dialog
  static void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Download Failed'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  static void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text('Storage permission is required to download images.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}