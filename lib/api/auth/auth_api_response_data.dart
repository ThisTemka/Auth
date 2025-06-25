import 'package:get/get.dart';

enum AuthApiResponseData {
  error('error'),
  info('info'),
  jwt('jwt'),
  refreshToken('refresh_token'),
  userId('user_id');

  final String _key;

  const AuthApiResponseData(this._key);

  dynamic getFrom(Response response) {
    return response.body[_key];
  }
}
