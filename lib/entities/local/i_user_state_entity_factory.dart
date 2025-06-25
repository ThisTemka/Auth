import 'package:auth/entities/local/user_state_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateEntityFactoryProvider =
    Provider.autoDispose<IUserStateEntityFactory>((ref) {
  return UserStateEntity.create;
});

typedef IUserStateEntityFactory = UserStateEntity Function({
  String token,
  bool isExpiresAt,
  DateTime? expiresAt,
  String refreshToken,
});
