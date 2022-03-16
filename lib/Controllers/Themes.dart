import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes{
bool isDark=false;
  static ThemeData darkTheme = ThemeData(
      accentColor: Colors.yellowAccent,
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.grey,
      ));

  static ThemeData lightTheme = ThemeData(
      accentColor: Colors.lightBlueAccent,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.blue,
        disabledColor: Colors.grey,
      ));
  static Color black = Colors.black;
  static Color grey = Colors.black87;

}