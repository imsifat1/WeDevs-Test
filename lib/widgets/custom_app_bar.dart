import 'package:flutter/material.dart';

import '../barrel/resources.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {

  final bool backButtonEnabled;
  final bool centerTitle;
  final Color backgroundColor;
  final String title;
  final bool searchBarEnabled;
  Function()? onSearch;

  CustomAppbar({Key? key,
    this.backButtonEnabled = true,
    this.centerTitle = true,
    this.backgroundColor = kPrimaryColor,
    this.title = "",
    this.searchBarEnabled = false,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: backButtonEnabled,
      title: Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),),
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: searchBarEnabled ? [IconButton(onPressed: () => onSearch, icon: const Icon(Icons.search, color: Colors.black, size: 22,))] : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
