import 'package:auth/pages/login/states/input/login_page_input_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageInputStateProvider = StateProvider<ILoginPageInputState>((ref) {
  return LoginPageInputState();
});

abstract interface class ILoginPageInputState {
  TextEditingController get inputEmailController;
}
