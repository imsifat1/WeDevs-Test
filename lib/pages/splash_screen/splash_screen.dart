import 'package:flutter/material.dart';

import '../../barrel/utils.dart';
import '../../route/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _sharedPreference = MySharedPreference();
  @override
  void initState() {
    super.initState();
    onStart(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/images/logo.png'),

              const SizedBox(height: 20,),

              const CircularProgressIndicator.adaptive()
            ],
          )),
    );
  }

  void onStart(BuildContext context) async {
    currentUser = await _sharedPreference.getUser();

    await Future<void>.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return;
    if (currentUser != null &&
        currentUser?.token != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(RouteManager.homePage, (route) => false);
      return;
    }

    Navigator.pushNamedAndRemoveUntil(
        context, RouteManager.login, (route) => false);
  }
}
