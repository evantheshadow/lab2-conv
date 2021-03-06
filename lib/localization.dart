import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  @override
  bool isSupported(Locale locale) => {'en', 'ru'}.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {

  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Converter',
      'conversion': 'Conversion',
      'enterValue': 'Enter value',
      'incorrectInput': 'Incorrect input',
    },
    'ru': {
      'title': 'Конвертер',
      'conversion': 'Конвертация',
      'enterValue': 'Введите...',
      'incorrectInput': 'Неправильно введены данные',
    }
  };

  Map<String, String> get _localized => _localizedValues[locale.languageCode];

  String get appTitle => _localized['title'];
  String get conversion => _localized['conversion'];
  String get enterValue => _localized['enterValue'];
  String get incorrectInput => _localized['incorrectInput'];

}
