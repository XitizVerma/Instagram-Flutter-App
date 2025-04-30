import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_flutter_app/utils/theme_constants.dart';

class UIHelper {
  static Widget customTextField({
    required TextEditingController controller,
    required String text,
    required bool toHide,
    double? height,
    double? width,
    double? borderRadius,
    Icon? trailingIcon,
  }) {
    return Container(
      height: height ?? 54,
      width: width ?? 343,
      decoration: BoxDecoration(
        color: Color(0XFF121212),
        border: Border.all(color: Color(0XFFFFFFFF), width: 1.5),
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
      ),
      child: Row(
        children: [
          Expanded(
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
          ),
          if (trailingIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () async {
                  if (trailingIcon.icon == Icons.content_paste) {
                    ClipboardData? clipboardData = await Clipboard.getData(
                      Clipboard.kTextPlain,
                    );
                    if (clipboardData != null && clipboardData.text != null) {
                      controller.text = clipboardData.text!.trim();
                    }
                  } else if (trailingIcon.icon == Icons.close) {
                    controller.text = "";
                  }
                },
                child: Icon(trailingIcon.icon, color: Colors.white, size: 22),
              ),
            ),
        ],
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
    double? height,
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

  static Widget customDropdownButton({
    required List<String> items,
    required String selectedValue,
    required void Function(String) onChanged,
    double? width,
    double? height,
    Color? backgroundColor,
  }) {
    backgroundColor = backgroundColor ?? ThemeConstants.PRIMARY;
    return Container(
      height: height ?? 45,
      width: width ?? 343,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:2),
            child: DropdownButton<String>(
              alignment: Alignment.center,
              value: selectedValue,
              dropdownColor: Colors.black,
              isExpanded: false,
              menuMaxHeight: 300,
              itemHeight: 50,
              items:
                  items.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              item,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          // Add divider after each item except the last one
                          if (item != items.last)
                            Divider(color: Colors.white, height: 2),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: (newValue) {
                if (newValue != null) onChanged(newValue);
              },
            ),
          ),
        ),
      ),
    );
  }
}
