import 'package:auth/entities/local/i_user_state_entity.dart';
import 'package:auth/entities/local/user_state_entity.dart';

class UserStateMapper {
  IUserStateEntity toUserStateEntity(Map<String, dynamic> userState) {
    return UserStateEntity(
      id: userState['id'],
      token: userState['token'],
      expiresAt: userState['expiresAt'] != null
          ? DateTime.parse(userState['expiresAt'])
          : null,
      refreshToken: userState['refreshToken'],
    );
  }

  Map<String, dynamic> toUserStateJson(IUserStateEntity userStateEntity) {
    return {
      'id': userStateEntity.id,
      'token': userStateEntity.token,
      'expiresAt': userStateEntity.expiresAt?.toIso8601String(),
      'refreshToken': userStateEntity.refreshToken,
    };
  }
}
