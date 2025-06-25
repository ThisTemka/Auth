import 'package:auth/states/user/i_user_state.dart';

class UserState implements IUserState {
  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? token;
  @override
  final String? refreshToken;

  @override
  final DateTime? expiresAt;

  const UserState({
    this.id,
    this.email,
    this.token,
    this.refreshToken,
    this.expiresAt,
  });

  @override
  UserState copyWith({
    String? id,
    String? email,
    String? token,
    String? refreshToken,
    bool isExpiresAt = false,
    DateTime? expiresAt,
  }) {
    return UserState(
      id: id ?? this.id,
      email: email ?? this.email,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: isExpiresAt ? expiresAt ?? this.expiresAt : null,
    );
  }
}
