import 'package:flutter/material.dart';

class UIHelper {
  static Widget customTextField({
    required TextEditingController controller,
    required String text,
    required bool toHide,
    double? height,
    double? width,
    double? borderRadius
  }) {
    return Container(
      height: height??54,
      width: width?? 343,
      decoration: BoxDecoration(
        color: Color(0XFF121212),
        border: Border.all(color: Color(0XFFFFFFFF), width: 1.5),
        borderRadius: BorderRadius.circular(borderRadius??15),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 15),
        child: TextField(
          controller: controller,
          obscureText: toHide,
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade100,
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  static Widget customImage({
    required String imageUrl,
    double? height,
    double? width,
  }) {
    return Image.asset(
      "assets/images/$imageUrl",
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  static Widget customTextButton({
    required String text,
    required VoidCallback callback,
  }) {
    return TextButton(
      onPressed: () {
        callback();
      },
      child: Text(
        text,
        style: TextStyle(color: Color(0XFF3797EF), fontSize: 14),
      ),
    );
  }

  static Widget customButton({
    required String text,
    required VoidCallback callback,
    Color? backgroundColor,
    double? width,
    double? height
  }) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? 343,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0XFF3797EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: Text(text, style: TextStyle(fontSize: 14, color: Colors.white)),
      ),
    );
  }
}
