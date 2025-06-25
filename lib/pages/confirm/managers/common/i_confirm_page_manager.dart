import 'package:auth/pages/confirm/managers/common/confirm_page_manager.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmPageManagerProvider =
    Provider.autoDispose<IConfirmPageManager>((ref) {
  final manager = ConfirmPageManager(ref);
  return manager;
});

abstract interface class IConfirmPageManager {
  void back();
  void inputCode(int index, String value);
  void verifyCode();
  TranslationType getTranslationType();
  void changeTranslation(TranslationType translationType);
}
