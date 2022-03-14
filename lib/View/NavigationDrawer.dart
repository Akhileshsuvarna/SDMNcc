import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ThemeController.dart';
import '../Controllers/Themes.dart';
import '../Route/Routes.dart';

class NavigationDrawer extends StatelessWidget {
  final ThemeController themeController =
  Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    themeController.getThemeStatus();
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            buildDrawerHeader(),
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Obx(
                        () => Text(
                      ' ${themeController.isLightTheme.value ? 'Light' : 'Dark'} theme',
                    ),
                  ),
                  const Spacer(),
                  ObxValue(
                        (data) => Switch(
                      value: themeController.isLightTheme.value,
                      onChanged: (val) {
                        themeController.isLightTheme.value = val;
                        Get.changeThemeMode(
                          themeController.isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                        );
                        themeController.saveThemeStatus();
                      },
                    ),
                    false.obs,
                  ),
                ],
              ),
            ),
            buildDrawerItem(
              icon: Icons.photo,
              text: "Gallery",
              onTap: () => navigate(0),
              tileColor: Get.currentRoute == Routes.PHOTO ? Colors.blue.withOpacity(0.5)  : null,
              textIconColor: Get.currentRoute == Routes.PHOTO
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
              icon: Icons.video_call,
              text: "Events",
              onTap: () => navigate(1),
              tileColor: Get.currentRoute == Routes.VIDEO ? Colors.blue.withOpacity(0.5)  : null,
              textIconColor: Get.currentRoute == Routes.VIDEO
                  ? Colors.white
                  : Colors.black,
            ),
            buildDrawerItem(
                icon: Icons.chat,
                text: "Report",
                onTap: () => navigate(2),
                tileColor: Get.currentRoute == Routes.CHAT ? Colors.blue.withOpacity(0.5) : null,
                textIconColor: Get.currentRoute == Routes.CHAT
                    ? Colors.white
                    : Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      accountName: Text("Akhilesh"),
      accountEmail: Text("Akhilesh@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
      currentAccountPictureSize: Size.square(72),
      // otherAccountsPictures: [
      //   CircleAvatar(
      //     backgroundColor: Colors.white,
      //     child: Text("RC"),
      //   )
      // ],
      // otherAccountsPicturesSize: Size.square(50),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon,
          // color: textIconColor
      ),
      title: Text(
        text,
        // style: TextStyle(color: textIconColor),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.toNamed(Routes.PHOTO);
    }
    else if (index == 1) {
      Get.toNamed(Routes.VIDEO);
    }
    if (index == 2) {
      Get.toNamed(Routes.CHAT);
    }
  }
}