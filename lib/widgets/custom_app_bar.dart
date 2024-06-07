import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final bool backButtonEnabled;
  final bool centerTitle;
  final Color backgroundColor;
  final String title;
  final List<Widget>? actions;

  CustomAppbar({Key? key,
    this.backButtonEnabled = true,
    this.centerTitle = true,
    this.backgroundColor = kPrimaryColor,
    this.title = "",
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: backButtonEnabled,
      title: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
