import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Route/Routes.dart';

class ThemeController extends GetxController {
  RxBool isLightTheme = false.obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  saveThemeStatus() async {
    SharedPreferences pref = await _prefs;
    pref.setBool('theme', isLightTheme.value);
  }

  getThemeStatus() async {
    var _isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
    }).obs;
    isLightTheme.value = (await _isLight.value)!;
    Get.changeThemeMode(isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
  }
  navigateToPage(int index) {
    if (index == 0) {
      Get.toNamed(Routes.PHOTO);
    } else if (index == 1) {
      Get.toNamed(Routes.VIDEO);
    } else if (index == 2) {
      Get.toNamed(Routes.CHAT);
    }
  }
}