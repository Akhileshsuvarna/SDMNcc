
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sdmncc/View/Login.dart';

import '../View/ChatView.dart';
import '../View/HomeView.dart';
import '../View/PhotoView.dart';
import '../View/VideoViewer.dart';
import 'HomeBinding.dart';
import 'Routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Login;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Paths.PHOTO,
      page: () => PhotoView(),
    ),
    GetPage(
      name: Paths.VIDEO,
      page: () => VideoView(),
    ),
    GetPage(
      name: Paths.CHAT,
      page: () => ChatView(),
    ), GetPage(
      name: Paths.Login,
      page: () => const LoginScreen(),
    ),
  ];
}