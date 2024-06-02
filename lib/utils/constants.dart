import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

const String english = "en";
const String bangla = "bn";

const int kDefaultTimeout = 20;
const int timeoutSeconds = 15;
const int pageLimit = 30;

final AddressCheckOptions options = AddressCheckOptions(address: InternetAddress("8.8.8.8"), port: 53, timeout: const Duration(seconds: 2));

const double kDefaultPaddingHorizontal = 12;
const double kDefaultPaddingVertical = 15;
const double kDefaultRadius = 10;

const String menu = "";

List<String> collectionType = ['Authorized', 'Unauthorized'];

Color getCheckBoxColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.blue;
}

double convertDouble(String hexString) {
  final String hexStringPadded = hexString.padLeft(16, '0');

  return (ByteData(8)
    ..setInt32(0, int.parse(hexStringPadded.substring(0, 8), radix: 16))
    ..setInt32(4, int.parse(hexStringPadded.substring(8, 16), radix: 16)))
      .getFloat64(0);
}
