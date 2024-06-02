import 'package:flutter/material.dart';

import '../barrel/models.dart';
import '../barrel/utils.dart';
import 'app_localization.dart';

Locale getLocale(String languageCode) {

  Locale locale;

  switch(languageCode) {

    case english:
      locale = Locale(languageCode, "US");
      break;

    case bangla:
      locale = Locale(languageCode, "BD");
      break;

    default:
      locale = const Locale(english, "US");
  }

  return locale;
}

List<Language> supportedLanguages(BuildContext context) {

  return [
    Language(name: AppLocalization.of(context).getTranslatedValue("english"), locale: const Locale(english, "US")),
    Language(name: AppLocalization.of(context).getTranslatedValue("bangla"), locale: const Locale(bangla, "BD")),
  ];
}