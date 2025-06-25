import 'package:auth/pages/confirm/states/input/confirm_page_input_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmPageInputStateProvider =
    StateProvider<IConfirmPageInputState>((ref) {
  final state = ConfirmPageInputState();
  return state;
});

abstract interface class IConfirmPageInputState {
  List<FocusNode> get focusNodes;
  List<TextEditingController> get controllers;

  void dispose();
}
