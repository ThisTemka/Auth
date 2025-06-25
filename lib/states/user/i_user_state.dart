import 'package:auth/states/user/user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateProvider = StateProvider<IUserState>((ref) {
  return UserState();
});

abstract interface class IUserState {
  String? get id;
  String? get email;
  String? get token;
  String? get refreshToken;
  DateTime? get expiresAt;

  IUserState copyWith({
    String? id,
    String? email,
    String? token,
    String? refreshToken,
    bool isExpiresAt = false,
    DateTime? expiresAt,
  });
}
