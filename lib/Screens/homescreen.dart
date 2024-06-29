import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilits/utilits.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(vertical: 12),
            height: Get.height / 10 * 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(60)),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                    height: 100,
                    width: 100,
                    child: Image.network(
                      "https://images.pexels.com/photos/6652928/pexels-photo-6652928.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes
                                  as int)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Center(child: Text('Failed to load image'));
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Add some space between image and text
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Yasin Mia'), Text('yasinpolasj@gmail.com')],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: Get.height / 10 * 6.75,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              color: AppColors.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    text: 'হোম',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.nightlight_round,
                    text: 'ডার্ক থিম',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.language,
                    text: 'ইংলিশ',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.facebook,
                    text: 'ফেইসবুক পেইজ',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.youtube_searched_for,
                    text: 'ইউটিউব চ্যানেল',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.share,
                    text: 'শেয়ার অ্যাপ',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
                  _buildDrawerItem(
                    context,
                    icon: Icons.star,
                    text: 'রিভিউ দেই',
                    onTap: () {
                      // Handle tap
                    },
                  ),
                  const Divider(),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required IconData icon,
        required String text,
        required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(
        text,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      onTap: onTap,
    );
  }
}
