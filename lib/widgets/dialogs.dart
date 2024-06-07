import 'package:flutter/material.dart';

import '../barrel/resources.dart';
import '../localization/app_localization.dart';

void confirmationDialog({required BuildContext context, required String title, required String message,
  Function? onPositive, Function? onNegative, IconData? iconData}) {

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {

      return WillPopScope(
        onWillPop: () {
          return Future(() => true);
        },
        child: AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.white24),
            borderRadius: BorderRadius.circular(10),
          ),
          title: Row(
            children: <Widget>[

              Icon(iconData ?? Icons.check_box_sharp, size: 25, color: Theme.of(context).primaryColor,),

              const SizedBox(width: 10,),

              Text(title,
                style: TextStyles.appbarTitleStyle,
              ),
            ],
          ),
          content: Text(message,
            style: TextStyles.textFieldHintStyle,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 12 * 2.5,
          ),
          actionsPadding: const EdgeInsets.symmetric(
            vertical: 15 * .7,
            horizontal: 12,
          ),
          actions: <Widget> [

            MaterialButton(
              color: Colors.grey[400],
              child: Text(AppLocalization.of(context).getTranslatedValue("cancel")),
              onPressed: () {

                Navigator.of(context).pop();
                onNegative!();
              },
            ),

            const SizedBox(width: 4),

            MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white.withOpacity(.8),
              child: Text(AppLocalization.of(context).getTranslatedValue("confirm")),
              onPressed: () {

                Navigator.of(context).pop();
                onPositive!();
              },
            ),
          ],
        ),
      );
    },
  );
}