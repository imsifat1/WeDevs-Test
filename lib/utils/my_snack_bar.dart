import 'package:flutter/material.dart';

import '../barrel/resources.dart';

enum SnackBarType {info, success, error, warning}

extension SnackBarColor on SnackBarType {

  Color backgroundColor() {

    switch (this) {
      case SnackBarType.info:
        return kLightSkyBlueColor;
      case SnackBarType.success:
        return kGreenAccentColor;
      case SnackBarType.error:
        return kRedAccentColor;
      case SnackBarType.warning:
        return kYellowAccentColor;
    }
  }

  IconData icon() {

    switch (this) {
      case SnackBarType.info:
        return Icons.info;
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
    }
  }
}

class MySnackBar {

  static void show({required BuildContext context, required String title, required String message, required SnackBarType type}) {

    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.fixed,
      backgroundColor: type.backgroundColor(),
      duration: const Duration(milliseconds: 5000),
      content: Container(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(type.icon(), size: 30, color: Colors.black87,),

            const SizedBox(width: 10),

            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Flexible(
                    child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.snackBarTitleStyle,
                    ),
                  ),

                  SizedBox(height: 5,),

                  Flexible(
                    child: Text(message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.snackBarMessageStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)..clearSnackBars()..showSnackBar(snackBar);
  }
}