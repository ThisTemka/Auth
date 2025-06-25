import 'package:auth/pages/confirm/states/input/i_confirm_page_input_state.dart';
import 'package:flutter/widgets.dart';

class ConfirmPageInputState implements IConfirmPageInputState {
  @override
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  @override
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
  }
}
