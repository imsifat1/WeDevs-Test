import 'package:flutter/material.dart';

import '../barrel/resources.dart';
import '../barrel/themes.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get splashTitleFirstHalfStyle => TextStyle(
    fontSize: 42,
    color: AppThemeNotifier.isDarkModeOn ? kAccentColor : const Color(0xFFA6A6A6),
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
  );

  static TextStyle get splashTitleSecondHalfStyle => const TextStyle(
    fontSize: 42,
    color: kPrimaryColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0,
    shadows: [
      Shadow(
        blurRadius: 7.0,
        color: Colors.white,
        offset: Offset(0, 0),
      ),
    ],
  );

  static TextStyle get loginHeaderStyle => const TextStyle(
    fontSize: 35,
    color: kPrimaryColor,
    fontWeight: FontWeight.w800,
  );

  static TextStyle get subtitleStyle => const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  static TextStyle get textFieldHeaderStyle => TextStyle(
    fontSize: 16,
    color: AppThemeNotifier.isDarkModeOn ? kGreenAccentColor : kSecondaryPrimaryColor,
    fontWeight: FontWeight.w500,
    letterSpacing: .55,
  );

  static TextStyle get employeeTitleStyle => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get employeeSubtitleStyle => TextStyle(
    fontSize: 13,
    color: Colors.grey[600],
  );

  static TextStyle get textFieldStyle => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.85),
  );

  static TextStyle get textFieldHintStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(.4),
  );

  static TextStyle get textFieldErrorStyle => const TextStyle(
    fontSize: 13,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get buttonTextStyle => const TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.w500,
    color: kAccentColor,
    letterSpacing: .55,
  );

  static TextStyle get progressIndicatorStyle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get languageTitleStyle => const TextStyle(
    fontSize: 15,
  );

  static TextStyle get snackBarTitleStyle => TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(.75),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get snackBarMessageStyle => TextStyle(
    fontSize: 12,
    color: Colors.black.withOpacity(.75),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get appbarTitleStyle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.85),
  );

  static TextStyle get moduleTitleStyle => TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.85),
  );

  static TextStyle get subSubModuleTitleStyle => TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.85),
  );

  static TextStyle get guidelineStyle => TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.85),
  );

  static TextStyle get addressStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: kBackgroundColorTilt,
  );

  static TextStyle get hintStyle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(.65),
  );

  static TextStyle get calenderDateStyle => TextStyle(
    fontSize: 11.5,
    fontWeight: FontWeight.w600,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.75),
  );

  static TextStyle get drawerTitleStyle => const TextStyle(
    fontSize: 15,
    
  );

  static TextStyle get inputHeaderStyle => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? Colors.white.withOpacity(.8) : Colors.black.withOpacity(.75),
  );

  static TextStyle get cardInfoStyle => const TextStyle(
    fontSize: 13.5,
  );

  static TextStyle get softwareDateStyle => const TextStyle(
    fontSize: 10,
    color: Colors.white,
    fontWeight: FontWeight.w300,
    letterSpacing: .55,
  );

  static TextStyle get footerTextStyle => const TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get fabLabelStyle => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppThemeNotifier.isDarkModeOn ? kGreenAccentColor : kPrimaryColor,
  );

  static TextStyle get userInfoStyle => const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );

  static TextStyle get dashboardTextStyle => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.blue.shade900
  );

  static TextStyle get drawerMenuStyle => TextStyle(
    fontSize: 13,
    color: Colors.black.withOpacity(.85),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get drawerHeaderStyle => TextStyle(
    fontSize: 11,
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get tableListItemStyle => TextStyle(
    fontSize: 12,
  );

  static TextStyle get tableListHeaderStyle => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold
  );
}