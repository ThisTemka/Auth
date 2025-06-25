import 'dart:ui';

enum TranslationType {
  en(Locale('en', 'US')),
  ru(Locale('ru', 'RU'));

  final Locale locale;
  String get languageCode => locale.languageCode;

  const TranslationType(this.locale);
}
