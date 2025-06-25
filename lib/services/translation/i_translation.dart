import 'package:auth/services/translation/impl_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

final translationProvider = Provider.autoDispose<ITranslation>((ref) {
  return ref.watch(implTranslationProvider);
});

abstract interface class ITranslation {
  Translations get translations;
  TranslationType get translationType;
  void changeLanguage(TranslationType translationType);
}
