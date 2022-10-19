import 'package:flutter/material.dart';

class AppColor {
  // static const primaryColor = Color.fromARGB(255, 243, 101, 91);
  // static const secondaryColor = Colors.white54;
  // static const bgWhiteColor = Colors.black;
  // static const titleTextColor = Colors.black38;
  // static const bgDarkColor = Colors.black;
  static const primaryTextColor = '#e72c45'; // dam mau do
  static const scondaryTextColor = '#ff3b24'; // nhat mau do
  static const whiteTextColor = '#ffffff';
  static const blackTextColor = '#333333';
  static const grayTextColor = '#696969';

  static const lightBtnHoverColor = '#f0f0f0'; // white
  static const darkBtnHoverColor = '#6d6d6d'; // dark

  static const primaryBtnColor = '#e72c45'; // dam mau do

  static const primaryDarkBtnColor = '#c14f53'; // dam mau nhat

  static const lightBackgroundColor = '#ffffff';
  static const grayBackgroundColor = '#f2f2f2';
  static const darkBackgroundColor = '#5e5e5e';

  static const headline =
      TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold);

  static const bodyText = TextStyle(color: Colors.grey, fontSize: 15);

  static const buttonText =
      TextStyle(color: Colors.black87, fontWeight: FontWeight.bold);

  static const bodyText2 =
      TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.white);
}

class DarkThemColor {
  const DarkThemColor._();
  static const primaryDark = Color.fromARGB(255, 250, 62, 62);
  static const primaryLight = Color.fromARGB(255, 241, 142, 143);
}

class LightThemeColor {
  static const primaryDark = Color.fromARGB(255, 66, 159, 246);
  static const primaryLight = Color.fromARGB(255, 159, 194, 240);
  static const accent = Color(0xFFFD8629);
  static const yellow = Color(0xFFFFBA49);
}
