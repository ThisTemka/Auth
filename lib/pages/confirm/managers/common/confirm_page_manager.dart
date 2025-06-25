import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/confirm/managers/common/i_confirm_page_manager.dart';
import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';
import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPageManager implements IConfirmPageManager {
  final Ref _ref;

  ConfirmPageManager(this._ref);

  IConfirmPageDataState get _pageDataState =>
      _ref.read(confirmPageDataStateProvider);
  set _pageDataState(IConfirmPageDataState state) =>
      _ref.read(confirmPageDataStateProvider.notifier).state = state;
  IConfirmPageInputState get _pageInputState =>
      _ref.read(confirmPageInputStateProvider);

  IRouter get _router => _ref.read(routerProvider);
  IAuthManager get _authManager => _ref.read(authManagerProvider);
  ITranslation get _translation => _ref.read(translationProvider);

  @override
  void back() {
    _router.navigateBack();
  }

  @override
  void inputCode(int index, String value) {
    _pageDataState = _pageDataState.copyWith(
      nullError: true,
    );
    _focusNextNumberInput(index);
  }

  void _focusNextNumberInput(int index) {
    _pageInputState.focusNodes[index].unfocus();
    if (index < 5) _pageInputState.focusNodes[index + 1].requestFocus();
  }

  @override
  void verifyCode() {
    final code = _pageInputState.controllers.map((e) => e.text).join();
    if (_validateCode(code)) {
      _pageDataState = _pageDataState.copyWith(isLoading: true);
      _confirmAuth(code);
    } else {
      _pageDataState = _pageDataState.copyWith(error: 'Invalid code');
    }
  }

  void _confirmAuth(String code) async {
    final result = await _authManager.confirm(code);
    if (result) {
      _router.navigateOn(RoutePagePaths.content);
    }
    _pageDataState = _pageDataState.copyWith(isLoading: false);
  }

  bool _validateCode(String code) {
    return code.length == 6;
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
