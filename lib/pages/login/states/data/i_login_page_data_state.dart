import 'package:auth/pages/login/states/data/login_page_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageDataStateProvider = StateProvider<ILoginPageDataState>((ref) {
  return LoginPageDataState();
});

abstract interface class ILoginPageDataState {
  String? get error;

  ILoginPageDataState copyWith({
    bool? nullError,
    String? error,
  });
}
