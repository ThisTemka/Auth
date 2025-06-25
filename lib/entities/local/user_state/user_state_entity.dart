import 'package:auth/entities/local/user_state/i_user_state_entity.dart';

class UserStateEntity implements IUserStateEntity {
  @override
  final String token;
  @override
  final DateTime? expiresAt;
  @override
  final String refreshToken;

  UserStateEntity({
    required this.token,
    this.expiresAt,
    required this.refreshToken,
  });

  factory UserStateEntity.create({
    String? token,
    bool isExpiresAt = false,
    DateTime? expiresAt,
    String? refreshToken,
  }) {
    return UserStateEntity(
      token: token ?? '',
      expiresAt: isExpiresAt ? expiresAt : null,
      refreshToken: refreshToken ?? '',
    );
  }
}
