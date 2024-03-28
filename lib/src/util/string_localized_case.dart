part of '../util.dart';

extension StringLocalizedCase on String {
  String toLocalizedUpperCase(Locale locale) {
    if (locale.languageCode == 'tr' || locale.languageCode == 'az') {
      return replaceAll('i', 'İ').replaceAll('ı', 'I').toUpperCase();
    }
    return toUpperCase();
  }

  String toLocalizedLowerCase(Locale locale) {
    if (locale.languageCode == 'tr' || locale.languageCode == 'az') {
      return replaceAll('İ', 'i').replaceAll('I', 'ı').toLowerCase();
    }
    return toLowerCase();
  }
}
