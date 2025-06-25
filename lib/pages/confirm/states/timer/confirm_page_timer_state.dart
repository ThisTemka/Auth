import 'dart:async';

import 'package:auth/pages/confirm/states/timer/i_confirm_page_timer_state.dart';

class ConfirmPageTimerState implements IConfirmPageTimerState {
  @override
  final int countdown;
  @override
  final Timer? timer;
  @override
  final DateTime? lastTick;

  const ConfirmPageTimerState({
    required this.countdown,
    this.timer,
    this.lastTick,
  });

  @override
  void dispose() {
    timer?.cancel();
  }

  @override
  ConfirmPageTimerState copyWith({
    int? countdown,
    Timer? timer,
    DateTime? lastTick,
  }) {
    return ConfirmPageTimerState(
      countdown: countdown ?? this.countdown,
      timer: timer ?? this.timer,
      lastTick: lastTick ?? this.lastTick,
    );
  }
}
