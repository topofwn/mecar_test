import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Localization {
  Localization(this._locale);

  final Locale _locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  Map<String, dynamic> _sentences;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/res/langs/${_locale.languageCode}.json');

    this._sentences = json.decode(data);
    return true;
  }

  String trans(String key) {
    if (key == null) {
      return '';
    }
    if (_sentences.containsKey(key)) return this._sentences[key];
    return key;
  }
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ko'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations = new Localization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationDelegate old) => true;
}
