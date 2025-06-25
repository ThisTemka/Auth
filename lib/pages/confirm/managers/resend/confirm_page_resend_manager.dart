import 'dart:async';

import 'package:auth/pages/confirm/managers/resend/i_confirm_page_resend_manager.dart';
import 'package:auth/pages/confirm/states/data/i_confirm_page_data_state.dart';
import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:auth/pages/confirm/states/timer/i_confirm_page_timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfirmPageResendManager implements IConfirmPageResendManager {
  final Ref ref;

  ConfirmPageResendManager(this.ref);

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

  @override
  void waitResendCode() {
    _startTimer();
    for (var focusNode in pageInputState.focusNodes) {
      focusNode.unfocus();
    }
    pageInputState.focusNodes[0].requestFocus();
    for (var controller in pageInputState.controllers) {
      controller.clear();
    }
    pageDataState = pageDataState.copyWith(
      nullError: true,
    );
  }

  void _startTimer() {
    pageDataState = pageDataState.copyWith(resendEnabled: false);
    pageTimerState = pageTimerState.copyWith(
        countdown: 30,
        lastTick: DateTime.now(),
        timer: Timer.periodic(
            const Duration(seconds: 1), (timer) => _onTickTimer()));
  }

  void _onTickTimer() {
    final seconds =
        (pageTimerState.lastTick!.difference(DateTime.now()).inMilliseconds /
                1000)
            .round();
    pageTimerState = pageTimerState.copyWith(
      countdown: pageTimerState.countdown - seconds,
      lastTick: DateTime.now(),
    );
    if (pageTimerState.countdown <= 0) {
      _stopTimer();
    }
  }

  void _stopTimer() {
    pageTimerState.timer?.cancel();
    pageTimerState = pageTimerState.copyWith(timer: null, countdown: 0);
    pageDataState = pageDataState.copyWith(
      resendEnabled: true,
    );
  }
}
