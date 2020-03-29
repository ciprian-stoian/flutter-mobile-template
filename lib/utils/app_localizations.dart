import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings;

  Future<AppLocalizations> load() async {
    _localizedStrings = Map<String, String>.from(json.decode(await rootBundle.loadString("assets/i18n/${locale.languageCode}.json")));

    return this;
  }

  String get({@required String key, Map<String, String> placeholders}) {
    String text = _localizedStrings[key];

    placeholders?.forEach((key, value) => text = text.replaceAll("{$key}", value));

    return text;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "ro"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return await AppLocalizations(locale).load();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
