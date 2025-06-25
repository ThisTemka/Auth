import 'package:auth/pages/login/states/data/login_page_data_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginPageDataStateProvider = StateProvider<ILoginPageDataState>((ref) {
  return LoginPageDataState(
    isLoading: false,
  );
});

abstract interface class ILoginPageDataState {
  String? get error;
  bool get isLoading;

  ILoginPageDataState copyWith({
    bool? nullError,
    String? error,
    bool? isLoading,
  });
}
