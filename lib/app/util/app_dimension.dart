import 'package:flutter/material.dart';

class AppDimemsions {
  static MediaQueryData? mediaQueryData;
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double blockSizeHorizontal = 0.0;
  static double blocKSizeVertical = 0.0;
  static double safeAreaHorizontal = 0.0;
  static double safeAreaVertical = 0.0;
  static double safeBlockHorizontal = 0.0;
  static double safeBlockVertical = 0.0;
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
    blocKSizeVertical = (screenHeight / 100);
    blockSizeHorizontal = (screenWidth / 100);

    safeAreaHorizontal =
        (mediaQueryData!.padding.left + mediaQueryData!.padding.right);

    safeAreaVertical =
        mediaQueryData!.padding.top + mediaQueryData!.padding.bottom;

    safeBlockHorizontal = (screenWidth - safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - safeBlockVertical) / 100;
  }
  // static const height10 = 10;
  // static const height15 = 15;
  // static const height45 = 45;

  // static const width10 = 10;
  // static const width15 = 15;
  // static const width45 = 45;

  // static const borderRadius10 = 10;
  // static const boraderRadius20 = 20;
}
