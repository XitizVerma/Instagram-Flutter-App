import 'dart:math';

class Utils {
  static int generateRandomInt(int max) {
    final random = Random();
    return random.nextInt(max + 1);
  }
}