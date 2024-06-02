import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class ButtonStyles {

  ButtonStyles({required this.context});
  final BuildContext context;

  ButtonStyle get bottomSubmitButtonStyle => ElevatedButton.styleFrom(
    minimumSize: Size(MediaQuery.of(context).size.width * 0.95, 42),
    backgroundColor: kPrimaryColor,
  );
}