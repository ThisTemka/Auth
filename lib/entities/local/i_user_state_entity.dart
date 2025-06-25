import 'package:auth/entities/i_entity.dart';

abstract interface class IUserStateEntity implements IEntity {
  int get id;
  String get token;
  DateTime? get expiresAt;
  String get refreshToken;
}
