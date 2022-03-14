
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ThemeController.dart';
import 'NavigationDrawer.dart';

class VideoView extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Video View'),
        centerTitle: true,
      ),

    );
  }
}