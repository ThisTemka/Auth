import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/login/managers/i_login_page_manager.dart';
import 'package:auth/pages/login/states/data/i_login_page_data_state.dart';
import 'package:auth/pages/login/states/input/i_login_page_input_state.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageManager implements ILoginPageManager {
  final Ref _ref;
  @override
  LoginPageManager(this._ref);

  ILoginPageDataState get _pageDataState =>
      _ref.read(loginPageDataStateProvider);
  set _pageDataState(ILoginPageDataState state) =>
      _ref.read(loginPageDataStateProvider.notifier).state = state;

  ILoginPageInputState get _pageInputState =>
      _ref.read(loginPageInputStateProvider);

  IRouter get _router => _ref.read(routerProvider);
  IAuthManager get _authManager => _ref.read(authManagerProvider);
  ITranslation get _translation => _ref.read(translationProvider);

  @override
  void login() {
    final email = _pageInputState.inputEmailController.text;
    if (_validateEmail(email)) {
      _pageDataState = _pageDataState.copyWith(isLoading: true);
      _authLogin(email);
    } else {
      _pageDataState = _pageDataState.copyWith(error: 'Invalid email');
    }
  }

  void _authLogin(String email) async {
    final result = await _authManager.login(email);
    if (result) {
      _router.navigateTo(RoutePagePaths.confirm);
    }
    _pageDataState = _pageDataState.copyWith(isLoading: false);
  }

  bool _validateEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email);
  }

  @override
  void inputEmail(String email) {
    _pageDataState = _pageDataState.copyWith(
      nullError: true,
    );
  }

  @override
  TranslationType getTranslationType() {
    return _translation.translationType;
  }

  @override
  void changeTranslation(TranslationType translationType) {
    _translation.changeLanguage(translationType);
  }
}
