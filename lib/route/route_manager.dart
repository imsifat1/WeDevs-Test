import 'package:flutter/material.dart';


class RouteManager {

  static const String splashScreen = "/";
  static const String home = "/home";

  static Route<dynamic> generate(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch(settings.name){

      case splashScreen:
        return MaterialPageRoute(builder: (_) => SizedBox());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: SafeArea(child: Center(child: Text("Page not found!")))));
    }
  }
}