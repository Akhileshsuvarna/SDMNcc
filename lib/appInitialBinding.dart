import 'package:get/get.dart';
import 'Controllers/ThemeController.dart';

class AppInitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
  }}