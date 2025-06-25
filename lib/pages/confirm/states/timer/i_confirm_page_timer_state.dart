import 'dart:async';

import 'package:auth/pages/confirm/states/timer/confirm_page_timer_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmPageTimerStateProvider =
    StateProvider<IConfirmPageTimerState>((ref) {
  final state = ConfirmPageTimerState(countdown: 30);
  return state;
});

abstract interface class IConfirmPageTimerState {
  int get countdown;
  Timer? get timer;
  DateTime? get lastTick;

  void dispose();

  IConfirmPageTimerState copyWith({
    int? countdown,
    Timer? timer,
    DateTime? lastTick,
  });
}
