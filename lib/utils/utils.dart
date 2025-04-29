import 'dart:math';

import 'package:flutter/cupertino.dart';

class Utils {
  static int generateRandomInt(int max) {
    final random = Random();
    return random.nextInt(max + 1);
  }

  static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}