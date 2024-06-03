import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    AppThemeNotifier.setTheme(brightness);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, mode, _) {

        return MaterialApp(
          title: dotenv.env['APP_TITLE']!,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
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
          initialRoute: RouteManager.login,
        );
      },
    );
  }

  void setLocale(Locale locale) {

    MyApp.appLocale = locale;

    setState(() {
      _locale = locale;
    });
  }
}

