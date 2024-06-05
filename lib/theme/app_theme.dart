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

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kGreenAccentColor,
    fontFamily: 'Inter',
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kGreenAccentColor,
      secondary: kAccentColor,
    ),
    scaffoldBackgroundColor: kBackgroundColorDark,
    backgroundColor: kBackgroundColorDark,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kGreenAccentColor,
    ),
    focusColor: kGreenAccentColor,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.black,
      shadowColor: Colors.grey[800],
      iconTheme: IconThemeData(
        color: Colors.white.withOpacity(.8),
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle.copyWith(
        color: Colors.white.withOpacity(.8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.textFieldHintStyle,
    ),
  );
}