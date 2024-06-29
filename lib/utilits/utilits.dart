import 'dart:ui';

class AppColors {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color blackColor = Color(0xFF000000);
}

class AppText {
  static const String welcome = "Welcome";
  static const String switchBook = "Switch Book";
  static const String settings = "Settings";
}

class ImagePath {
  static const String epolliLogo = 'assets/images/epolli_logo.png'; // Path to your logo
}

TextStyle myStyleRoboto(double fontSize, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}