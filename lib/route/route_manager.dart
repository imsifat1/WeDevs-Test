import 'package:flutter/material.dart';

import '../barrel/models.dart';
import '../barrel/utils.dart';
import '../barrel/views.dart';
import '../barrel/widgets.dart';

class RouteManager {

  static const String splashScreen = "/";
  static const String home = "/home";
  static const String signUp = "/sign-up";

  static Route<dynamic> generate(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch(settings.name){

      case splashScreen:
        return MaterialPageRoute(builder: (_) => SizedBox());

      case signUp:
        return MaterialPageRoute(builder: (_) => SignUp());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: SafeArea(child: Center(child: Text("Page not found!")))));
    }
  }
}