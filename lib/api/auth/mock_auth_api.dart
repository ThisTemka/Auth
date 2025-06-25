import 'package:auth/api/auth/i_auth_api.dart';
import 'package:auth/api/auth/responses/login_auth_api_response.dart';
import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:auth/api/response_status.dart';

class MockAuthApi implements IAuthApi {
  @override
  Future<LoginAuthApiResponse> login(String email) async {
    return LoginAuthApiResponse(
      status: ResponseStatus.success,
      error: null,
      info: null,
    );
  }

  @override
  Future<ConfirmLoginAuthApiResponse> confirm(String email, String code) async {
    return ConfirmLoginAuthApiResponse(
      status: ResponseStatus.success,
      error: null,
      jwt: 'jwt',
      refreshToken: 'refreshToken',
    );
  }

  @override
  Future<RefreshAuthApiResponse> refresh(String refreshToken) async {
    return RefreshAuthApiResponse(
      status: ResponseStatus.success,
      error: null,
      jwt: 'jwt',
      refreshToken: 'refreshToken',
    );
  }

  @override
  Future<UserAuthApiResponse> user(String token) async {
    return UserAuthApiResponse(
      status: ResponseStatus.success,
      error: null,
      userId: '1',
    );
  }
}
