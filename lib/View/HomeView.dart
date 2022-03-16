import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sdmncc/View/savePoster.dart';
import '../Controllers/ThemeController.dart';
import 'HomePage.dart';
import 'NavigationDrawer.dart';
import 'SettingsPage.dart';
import 'SourcePage.dart';

class HomeView extends GetView<ThemeController> {
   HomeView({Key? key}) : super(key: key);
   final TextStyle unselectedLabelStyle = TextStyle(
       color: Colors.white.withOpacity(0.5),
       fontWeight: FontWeight.w500,
       fontSize: 12);
   final ThemeController themeController =
   Get.find<ThemeController>();
   final TextStyle selectedLabelStyle =
   TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

   buildBottomNavigationMenu(context, landingPageController) {
     return Obx(() => MediaQuery(
         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
         child: SizedBox(
           height: 54,
           child: BottomNavigationBar(
             showUnselectedLabels: true,
             showSelectedLabels: true,
             onTap: landingPageController.changeTabIndex,
             currentIndex: landingPageController.tabIndex.value,
             backgroundColor: Colors.blue,
             unselectedItemColor: Colors.white.withOpacity(0.5),
             selectedItemColor: Colors.white,
             unselectedLabelStyle: unselectedLabelStyle,
             selectedLabelStyle: selectedLabelStyle,
             items: [
               BottomNavigationBarItem(
                 icon: Container(
                   margin: EdgeInsets.only(bottom: 7),
                   child: Icon(
                     Icons.home,
                     size: 20.0,
                   ),
                 ),
                 label: 'Home',
                 // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
               ),
               BottomNavigationBarItem(
                 icon: Container(
                   margin: EdgeInsets.only(bottom: 7),
                   child: Icon(
                     Icons.search,
                     size: 20.0,
                   ),
                 ),
                 label: 'Event',
                 // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
               ),
               BottomNavigationBarItem(
                 icon: Container(
                   margin: EdgeInsets.only(bottom: 7),
                   child: Icon(
                     Icons.settings,
                     size: 20.0,
                   ),
                 ),
                 label: 'Settings',
                 // backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
               ),
             ],
           ),
         )));
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent, // Navigation bar
          statusBarColor: Colors.transparent, // Status bar
        ),
        centerTitle: true,
      ),
      bottomNavigationBar:
      buildBottomNavigationMenu(context, themeController),
      body: Obx(() => IndexedStack(
        index: themeController.tabIndex.value,
        children: const [
          HomePage(),
          SourcePage(),
          // SettingsPage(),
          addPost(),
        ],
      )),
    );
  }
  // final List<Color> kMixedColors = [
  //   Color(0xff71A5D7),
  //   Color(0xff72CCD4),
  //   Color(0xffFBAB57),
  //   Color(0xffF8B993),
  //   Color(0xff962D17),
  //   Color(0xffc657fb),
  //   Color(0xfffb8457),
  // ];

}