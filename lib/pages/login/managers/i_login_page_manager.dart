import 'package:auth/pages/login/managers/login_page_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageManagerProvider =
    Provider.autoDispose<ILoginPageManager>((ref) => LoginPageManager(ref));

abstract interface class ILoginPageManager {
  void login();
  void inputEmail(String email);
}
