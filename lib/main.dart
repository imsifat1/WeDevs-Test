import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wedev_test/barrel/utils.dart';
import 'package:wedev_test/barrel/views.dart';

import 'barrel/themes.dart';
import 'localization/app_localization.dart';
import 'route/route_manager.dart';


Future<void> main() async {
  await dotenv.load(fileName: kDebugMode ? ".env.development" : ".env.production");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static Locale? appLocale;

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {

    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  final _sharedPreference = MySharedPreference();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: dotenv.env['APP_TITLE']!,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("bn", "BD"),
      ],
      localeResolutionCallback: (Locale? deviceLocale, Iterable<Locale> supportedLocales) {

        for(var locale in supportedLocales) {

          if(locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {

            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },
      onGenerateRoute: RouteManager.generate,
      home: (currentUser != null && currentUser?.token != null) ? HomePage() : Login(),
    );
  }

  void setLocale(Locale locale) {

    MyApp.appLocale = locale;

    setState(() {
      _locale = locale;
    });
  }

  void getUserInfo() async {
    currentUser = await _sharedPreference.getUser();
  }
}

