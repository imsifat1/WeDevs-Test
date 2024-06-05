import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get textFieldHeaderStyle => const TextStyle(
    fontSize: 16,
    color: kSecondaryPrimaryColor,
    fontWeight: FontWeight.w500,
    letterSpacing: .55,
  );

  static TextStyle get textFieldStyle => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black.withOpacity(.85),
  );

  static TextStyle get textFieldHintStyle => const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Color(0xFFA4A9AF),
  );

  static TextStyle get textFieldErrorStyle => const TextStyle(
    fontSize: 13,
    color: Colors.red,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get appbarTitleStyle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(.85),
  );

  static TextStyle get hintStyle => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black.withOpacity(.65),
  );

  static TextStyle get progressIndicatorStyle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get snackBarTitleStyle => TextStyle(
    fontSize: 16,
    color: Colors.black.withOpacity(.75),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get snackBarMessageStyle => TextStyle(
    fontSize: 14,
    color: Colors.black.withOpacity(.75),
    fontWeight: FontWeight.w400,
  );
}