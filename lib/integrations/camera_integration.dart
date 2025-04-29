import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraIntegration {
  // Method to open camera
  static Future<void> openCamera(BuildContext context) async {
    try {
      // Use image_picker to open camera
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
      );

      // Handle the captured image
      if (image != null) {
        // Convert XFile to File
        File imageFile = File(image.path);

        // Navigate to preview or do something with the image
        _showImagePreview(context, imageFile);
      }
    } catch (e) {
      // Handle any errors
      _showErrorDialog(context, e.toString());
    }
  }

  // Method to show image preview
  static void _showImagePreview(BuildContext context, File imageFile) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Preview'),
          content: Image.file(imageFile),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Share'),
              onPressed: () {
                // Implement share functionality
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Error handling method
  static void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}