import 'package:auth/pages/content/managers/content_page_manager.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contentPageManagerProvider =
    Provider.autoDispose<IContentPageManager>((ref) {
  return ContentPageManager(ref);
});

abstract interface class IContentPageManager {
  void logout();
  void back();
  TranslationType getTranslationType();
  void changeTranslation(TranslationType translationType);
}
