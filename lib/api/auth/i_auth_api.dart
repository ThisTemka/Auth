import 'package:auth/api/auth/auth_api.dart';
import 'package:auth/api/auth/mock_auth_api.dart';
import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:auth/core/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authApiProvider = Provider.autoDispose<IAuthApi>((ref) {
  final settings = ref.read(settingsProvider);
  if (!settings.isUseServer) {
    return MockAuthApi();
  }
  return AuthApi();
});

abstract interface class IAuthApi {
  Future<LoginAuthApiResponse> login(String email);
  Future<ConfirmLoginAuthApiResponse> confirm(String email, String code);
  Future<RefreshAuthApiResponse> refresh(String refreshToken);
  Future<UserAuthApiResponse> user(String token);
}
