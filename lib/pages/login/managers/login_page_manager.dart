import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/login/managers/i_login_page_manager.dart';
import 'package:auth/pages/login/states/data/i_login_page_data_state.dart';
import 'package:auth/pages/login/states/input/i_login_page_input_state.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageManager implements ILoginPageManager {
  final Ref ref;
  @override
  LoginPageManager(this.ref);

  ILoginPageDataState get pageDataState => ref.read(loginPageDataStateProvider);
  set pageDataState(ILoginPageDataState state) =>
      ref.read(loginPageDataStateProvider.notifier).state = state;

  ILoginPageInputState get pageInputState =>
      ref.read(loginPageInputStateProvider);
  set pageInputState(ILoginPageInputState state) =>
      ref.read(loginPageInputStateProvider.notifier).state = state;

  IRouter get router => ref.read(routerProvider);
  IAuthManager get authManager => ref.read(authManagerProvider);

  @override
  void login() {
    final email = pageInputState.inputEmailController.text;
    if (_validateEmail(email)) {
      _authLogin(email);
    } else {
      pageDataState = pageDataState.copyWith(error: 'Invalid email');
    }
  }

  void _authLogin(String email) async {
    final result = await authManager.login(email);
    if (result) {
      router.navigateTo(RoutePagePaths.confirm);
    }
  }

  bool _validateEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  @override
  void inputEmail(String email) {
    pageDataState = pageDataState.copyWith(
      nullError: true,
    );
  }
}
