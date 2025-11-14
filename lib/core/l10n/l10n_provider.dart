import 'package:flutter/material.dart';

class L10nProvider extends ChangeNotifier {
  Locale _locale = const Locale('es', '');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    if (_locale.languageCode == 'es') {
      setLocale(const Locale('en', ''));
    } else {
      setLocale(const Locale('es', ''));
    }
  }

  bool get isSpanish => _locale.languageCode == 'es';
  bool get isEnglish => _locale.languageCode == 'en';
}
