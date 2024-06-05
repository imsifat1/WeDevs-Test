import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class AppTheme {

  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: kBackgroundColorLight,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kPrimaryColor,
    ),
    focusColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: kPrimaryColor,
      shadowColor: Colors.grey[100],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle.copyWith(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ), colorScheme: const ColorScheme.light().copyWith(
      primary: kPrimaryColor,
      secondary: kAccentColor,
    ).copyWith(background: kBackgroundColorLight),
  );
}