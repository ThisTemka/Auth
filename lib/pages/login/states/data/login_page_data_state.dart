import 'package:auth/pages/login/states/data/i_login_page_data_state.dart';

class LoginPageDataState implements ILoginPageDataState {
  @override
  final String? error;
  @override
  final bool isLoading;

  LoginPageDataState({
    this.error,
    this.isLoading = false,
  });

  @override
  LoginPageDataState copyWith({
    String? email,
    bool? nullError,
    String? error,
    bool? isLoading,
  }) {
    return LoginPageDataState(
      error: nullError == true ? null : error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
