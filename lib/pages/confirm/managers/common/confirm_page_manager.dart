import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/confirm/managers/common/i_confirm_page_manager.dart';
import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';
import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:auth/pages/confirm/states/timer/i_confirm_page_timer_state.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPageManager implements IConfirmPageManager {
  final Ref ref;

  ConfirmPageManager(this.ref);

  IUserState get userState => ref.read(userStateProvider);
  set userState(IUserState user) =>
      ref.read(userStateProvider.notifier).state = user;

  IConfirmPageDataState get pageDataState =>
      ref.read(confirmPageDataStateProvider);
  set pageDataState(IConfirmPageDataState state) =>
      ref.read(confirmPageDataStateProvider.notifier).state = state;
  IConfirmPageInputState get pageInputState =>
      ref.read(confirmPageInputStateProvider);
  set pageInputState(IConfirmPageInputState state) =>
      ref.read(confirmPageInputStateProvider.notifier).state = state;
  IConfirmPageTimerState get pageTimerState =>
      ref.read(confirmPageTimerStateProvider);
  set pageTimerState(IConfirmPageTimerState state) =>
      ref.read(confirmPageTimerStateProvider.notifier).state = state;

  IRouter get router => ref.read(routerProvider);
  IAuthManager get authManager => ref.read(authManagerProvider);
  ITranslation get translation => ref.read(translationProvider);

  @override
  void back() {
    router.navigateBack();
  }

  @override
  void inputCode(int index, String value) {
    pageDataState = pageDataState.copyWith(
      nullError: true,
    );
    _focusNextNumberInput(index);
  }

  void _focusNextNumberInput(int index) {
    pageInputState.focusNodes[index].unfocus();
    if (index < 5) pageInputState.focusNodes[index + 1].requestFocus();
  }

  @override
  void verifyCode() {
    final code = pageInputState.controllers.map((e) => e.text).join();
    if (_validateCode(code)) {
      _confirmAuth(code);
    } else {
      pageDataState = pageDataState.copyWith(error: 'Invalid code');
    }
  }

  void _confirmAuth(String code) async {
    final result = await authManager.confirm(code);
    if (result) {
      router.navigateOn(RoutePagePaths.content);
    }
  }

  bool _validateCode(String code) {
    return code.length == 6;
  }

  @override
  TranslationType getTranslationType() {
    return translation.translationType;
  }

  @override
  void changeTranslation(TranslationType translationType) {
    translation.changeLanguage(translationType);
  }
}
