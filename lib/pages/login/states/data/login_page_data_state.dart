import 'package:auth/pages/login/states/data/i_login_page_data_state.dart';

class LoginPageDataState implements ILoginPageDataState {
  @override
  final String? error;

  LoginPageDataState({
    this.error,
  });

  @override
  LoginPageDataState copyWith({
    String? email,
    bool? nullError,
    String? error,
  }) {
    return LoginPageDataState(
      error: nullError == true ? null : error ?? this.error,
    );
  }
}
