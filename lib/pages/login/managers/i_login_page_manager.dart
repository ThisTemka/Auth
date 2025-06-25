import 'package:auth/pages/login/managers/login_page_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth/services/translation/translation_type.dart';

final loginPageManagerProvider =
    Provider.autoDispose<ILoginPageManager>((ref) => LoginPageManager(ref));

abstract interface class ILoginPageManager {
  void login();
  void inputEmail(String email);
  TranslationType getTranslationType();
  void changeTranslation(TranslationType translationType);
}
