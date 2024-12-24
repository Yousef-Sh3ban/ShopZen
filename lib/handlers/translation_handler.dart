import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GlobalTranslations {
  Locale? _locale;
  Map<dynamic, dynamic>? _localizedValues;
  String word(String key) {
    return (_localizedValues == null || _localizedValues![key] == null)
        ? '** $key not found'
        : _localizedValues![key];
  }
  String text(List<String> keys) {
    String text = "";
    for (var key in keys) {
      if (_localizedValues == null || _localizedValues![key] == null) {
        text += ' ** $key not found';
      }
      else {
        text += " "+_localizedValues![key];
      }
    }
    return text;
  }
  get currentLanguage => _locale == null ? 'ar' : _locale!.languageCode;
  get locale => _locale;
  Future<void> initTranslation(
      [String language = "en", bool saveInPrefs = true]) async {
    _locale = Locale(language);
    String jsonContent = await rootBundle
        .loadString("assets/lang/$language.json");
    _localizedValues = json.decode(jsonContent);
    return;
  }
  static final GlobalTranslations translator = GlobalTranslations._internal();
  GlobalTranslations._internal();
}

class AppLocalizationsDelegate extends LocalizationsDelegate<GlobalTranslations> {
  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<GlobalTranslations> load(Locale locale) async {
    return GlobalTranslations.translator..initTranslation(locale.languageCode,false);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}