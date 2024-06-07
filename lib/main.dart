import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wedev_test/barrel/utils.dart';

import 'app_bloc_observer.dart';
import 'barrel/themes.dart';
import 'localization/app_localization.dart';
import 'route/route_manager.dart';


Future<void> main() async {
  await dotenv.load(fileName: kDebugMode ? ".env.development" : ".env.production");

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
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
      initialRoute: RouteManager.splashScreen,
    );
  }

  void setLocale(Locale locale) {

    MyApp.appLocale = locale;

    setState(() {
      _locale = locale;
    });
  }
}

