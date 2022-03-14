import 'package:get/get.dart';

import '../Controllers/ThemeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(),
    );
  }
}