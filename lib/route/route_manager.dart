import 'package:flutter/material.dart';

import '../barrel/views.dart';

class RouteManager {

  static const String splashScreen = "/";
  static const String homePage = "/home-page";
  static const String login = "/login";
  static const String signUp = "/sign-up";

  static Route<dynamic> generate(RouteSettings settings) {
    final dynamic args = settings.arguments;
    switch(settings.name){

      case splashScreen:
        return MaterialPageRoute(builder: (_) => SizedBox());

      case login:
        return MaterialPageRoute(builder: (_) => Login());

      case signUp:
        return MaterialPageRoute(builder: (_) => SignUp());

      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: SafeArea(child: Center(child: Text("Page not found!")))));
    }
  }
}