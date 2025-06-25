import 'dart:async';

import 'package:auth/pages/confirm/managers/resend/i_confirm_page_resend_manager.dart';
import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';
import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:auth/pages/confirm/states/timer/i_confirm_page_timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPageResendManager implements IConfirmPageResendManager {
  final Ref _ref;

  ConfirmPageResendManager(this._ref);

  IConfirmPageDataState get _pageDataState =>
      _ref.read(confirmPageDataStateProvider);
  set _pageDataState(IConfirmPageDataState state) =>
      _ref.read(confirmPageDataStateProvider.notifier).state = state;
  IConfirmPageInputState get _pageInputState =>
      _ref.read(confirmPageInputStateProvider);
  IConfirmPageTimerState get _pageTimerState =>
      _ref.read(confirmPageTimerStateProvider);
  set _pageTimerState(IConfirmPageTimerState state) =>
      _ref.read(confirmPageTimerStateProvider.notifier).state = state;

  @override
  void waitResendCode() {
    _startTimer();
    for (var focusNode in _pageInputState.focusNodes) {
      focusNode.unfocus();
    }
    _pageInputState.focusNodes[0].requestFocus();
    for (var controller in _pageInputState.controllers) {
      controller.clear();
    }
    _pageDataState = _pageDataState.copyWith(
      nullError: true,
    );
  }

  void _startTimer() {
    _pageDataState = _pageDataState.copyWith(resendEnabled: false);
    _pageTimerState = _pageTimerState.copyWith(
        countdown: 30,
        lastTick: DateTime.now(),
        timer: Timer.periodic(
            const Duration(seconds: 1), (timer) => _onTickTimer()));
  }

  void _onTickTimer() {
    final seconds =
        (DateTime.now().difference(_pageTimerState.lastTick!).inMilliseconds /
                1000)
            .round();
    _pageTimerState = _pageTimerState.copyWith(
      countdown: _pageTimerState.countdown - seconds,
      lastTick: DateTime.now(),
    );
    if (_pageTimerState.countdown <= 0) {
      _stopTimer();
    }
  }

  void _stopTimer() {
    _pageTimerState.timer?.cancel();
    _pageTimerState = _pageTimerState.copyWith(timer: null, countdown: 0);
    _pageDataState = _pageDataState.copyWith(
      resendEnabled: true,
    );
  }
}
