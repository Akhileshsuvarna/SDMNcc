
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/ThemeController.dart';
import 'NavigationDrawer.dart';

class PhotoView extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Photo View'),
        centerTitle: true,
      ),

    );
  }
}