import 'package:flutter/material.dart';

class UIHelper {
  static Widget customTextField({
    required TextEditingController controller,
    required String text,
    required bool toHide,
  }) {
    return Container(
      height: 54,
      width: 343,
      decoration: BoxDecoration(
        color: Color(0XFF121212),
        border: Border.all(color: Color(0XFFFFFFFF)),
        borderRadius: BorderRadius.circular(5),
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
              fontWeight: FontWeight.normal,
              color: Colors.grey.shade100,
            ),
          ),
        ),
      ),
    );
  }

  static Widget customImage({required String imageUrl}) {
    return Image.asset("assets/images/$imageUrl");
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
  }) {
    return SizedBox(
      height: 45,
      width: 343,
      child: ElevatedButton(
        onPressed: (){
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFF3797EF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        ),
        child: Text(text, style: TextStyle(fontSize: 14, color: Colors.white),)
      ),
    );
  }
}
