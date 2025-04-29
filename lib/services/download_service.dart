import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloadService {
  static Future<String?> downloadFile({
    required BuildContext context,
    required String url,
    required Function(double progress) onProgressUpdate,
  }) async {
    try {
      if (url.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '⚠️ Please enter a valid URL !',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
            showCloseIcon: true,
          ),
        );
        return null;
      }

      final dio = Dio();

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = 'download_$timestamp${_getFileExtension(url)}';

      final directory = await _getDownloadDirectory();
      final savePath = '${directory.path}/$filename';

      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          final progress = received / total;
          onProgressUpdate(progress);
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
        ),
      );

      _showSuccessDialog(context, savePath);

      return savePath;
    } catch (e) {
      print('Download error: $e');
      _showErrorDialog(context, 'Download failed');
      return null;
    }
  }

  static String _getFileExtension(String url) {
    final uri = Uri.parse(url);
    final path = uri.path;
    return path.contains('.') ? '.${path.split('.').last}' : '.txt';
  }

  static Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return Directory('/storage/emulated/0/Download');
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    }
    return await getTemporaryDirectory();
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Download Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  static void _showSuccessDialog(BuildContext context, String filePath) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Download Complete'),
            content: Text('File saved at: $filePath'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }
}
