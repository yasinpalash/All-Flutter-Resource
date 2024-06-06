import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color primaryColor = Color(0xFF6200EE); // Primary color
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(ImagePath.epolliLogo),
                  ),
                ),
                Text(
                  AppText.welcome,
                  style: myStyleRoboto(20, AppColors.whiteColor, FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 10), // Space between header and items
          _buildDrawerItem(
            context,
            icon: Icons.home,
            text: 'হোম',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.nightlight_round,
            text: 'ডার্ক থিম',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.language,
            text: 'ইংলিশ',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.facebook,
            text: 'ফেইসবুক পেইজ',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.youtube_searched_for,
            text: 'ইউটিউব চ্যানেল',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.share,
            text: 'শেয়ার অ্যাপ',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.star,
            text: 'রিভিউ দেই',
            onTap: () {
              // Handle tap
            },
          ),
          Divider(),
          _buildDrawerItem(
            context,
            icon: Icons.close,
            text: 'ক্লোস অ্যাপ',
            onTap: () {
              // Handle tap
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        text,
        style: myStyleRoboto(16, AppColors.blackColor, FontWeight.w500),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      onTap: onTap,
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('App Drawer Example')),
        drawer: AppDrawer(),
        body: Center(child: Text('Content Area')),
      ),
    );
  }
}
