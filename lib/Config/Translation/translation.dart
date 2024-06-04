import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/data.dart';
import 'locale/ar.dart';
import 'locale/en.dart';

class TranslationX extends Translations {
  static const fallbackLocale = Locale('en');
  static final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'ar', 'name': 'عربي'},
  ];

  static const locales = [
    Locale('en'),
    Locale('ar'),
  ];

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': en,
      'ar': ar,
    };
  }

  static String nameLanguage() {
    String x = Get.locale!.languageCode;
    for (var lang in languages) {
      if (x == lang['code']) {
        return lang['name']!;
      }
    }
    return x;
  }

  static get getLocale => Locale(LocalDataX.settings.language);
  static get getLanguage => LocalDataX.settings.language;
  static changeLocale(String lang) async {
    await Get.updateLocale(Locale(lang));
  }
}
