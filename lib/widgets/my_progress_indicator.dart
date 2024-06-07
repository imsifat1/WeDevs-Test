import 'package:flutter/material.dart';

import '../barrel/resources.dart';
import '../localization/app_localization.dart';

class MyProgressIndicator {

  static void showTextProgressIndicator(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {

        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Center(
            child: Material(
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Colors.white24),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                width: 250,
                height: 140,
                padding: const EdgeInsets.symmetric(
                  vertical: 15 / 2,
                  horizontal: 12 * 2,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(AppLocalization.of(context).getTranslatedValue("processing"),
                      style: TextStyles.progressIndicatorStyle,
                    ),

                    const SizedBox(height: 25,),

                    LinearProgressIndicator(
                      minHeight: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}