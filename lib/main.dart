import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/ThemeController.dart';
import 'Controllers/Themes.dart';
import 'Route/AppPages.dart';
import 'appInitialBinding.dart';
  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitialBinding().dependencies();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      initialRoute: AppPages.INITIAL,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}