import 'package:document_appmobile/app/util/app_color.dart';
import 'package:document_appmobile/app/util/app_style.dart';
import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  const AppThemes._();
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: LightThemeColor.accent),
        appBarTheme: AppBarTheme(
            backgroundColor: LightThemeColor.primaryDark,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black45),
            centerTitle: true,
            titleTextStyle: h2Style),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(LightThemeColor.accent))),
        hintColor: Colors.black45,
        inputDecorationTheme: InputDecorationTheme(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: textFieldStyle,
            focusedBorder: textFieldStyle,
            filled: true,
            contentPadding: const EdgeInsets.all(20),
            fillColor: Colors.white),
        bottomAppBarColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: LightThemeColor.accent),
        textTheme: TextTheme(
            headline1: h1Style,
            headline2: h2Style,
            headline3: h3Style,
            headline4: h3Style,
            headline5: h5StyleLight,
            bodyText1: bodyTextLight,
            subtitle1: subtitleLight),
        iconTheme: const IconThemeData(color: Colors.black45)),
    AppTheme.darkTheme: ThemeData(
        // scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: LightThemeColor.accent),
        appBarTheme: AppBarTheme(
            backgroundColor: DarkThemColor.primaryDark,
            elevation: 0,
            toolbarTextStyle: const TextStyle(color: Colors.white),
            iconTheme: const IconThemeData(color: Colors.black45),
            centerTitle: true,
            titleTextStyle: h2Style),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(LightThemeColor.accent))),
        // hintColor: Colors.white60,
        inputDecorationTheme: InputDecorationTheme(
          // border: const OutlineInputBorder(borderSide: BorderSide.none),
          // enabledBorder: textFieldStyle,
          // focusedBorder: textFieldStyle,
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          // fillColor: DarkThemColor.primaryLight
        ),
        // bottomAppBarColor: DarkThemColor.primaryLight,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            // unselectedItemColor: Colors.grey,
            selectedItemColor: LightThemeColor.accent),
        textTheme: TextTheme(
            headline1: h1Style.copyWith(color: Colors.white),
            headline2: h2Style.copyWith(color: Colors.white),
            headline3: h3Style.copyWith(color: Colors.white),
            headline4: h3Style.copyWith(color: Colors.white),
            headline5: h5StyleLight.copyWith(color: Colors.white),
            bodyText1: bodyTextLight.copyWith(color: Colors.white),
            subtitle1: subtitleLight.copyWith(color: Colors.white60)),
        iconTheme: const IconThemeData(color: Colors.white))
  };
}
