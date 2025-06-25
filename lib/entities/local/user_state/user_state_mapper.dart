import 'package:auth/entities/local/user_state/i_user_state_entity.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_factory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateMapperProvider = Provider.autoDispose<UserStateMapper>((ref) {
  final factory = ref.watch(userStateEntityFactoryProvider);
  return UserStateMapper(factory);
});

class UserStateMapper {
  final IUserStateEntityFactory _factory;

  UserStateMapper(this._factory);

  IUserStateEntity toUserStateEntity(Map<String, dynamic> userState) {
    return _factory(
      token: userState['token'],
      expiresAt: userState['expiresAt'] != null
          ? DateTime.parse(userState['expiresAt'])
          : null,
      refreshToken: userState['refreshToken'],
    );
  }

  Map<String, dynamic> toUserStateJson(IUserStateEntity userStateEntity) {
    return {
      'token': userStateEntity.token,
      'expiresAt': userStateEntity.expiresAt?.toIso8601String(),
      'refreshToken': userStateEntity.refreshToken,
    };
  }
}
