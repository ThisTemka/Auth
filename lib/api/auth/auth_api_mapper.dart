import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:auth/api/response_status.dart';
import 'package:get/get.dart';

import 'responses/login_auth_api_response.dart';

class AuthApiMapper {
  LoginAuthApiResponse toLoginAuthApiResponse(Response response) {
    final body = response.body;
    return LoginAuthApiResponse(
      status: response.statusCode == 200
          ? ResponseStatus.success
          : ResponseStatus.error,
      error: response.statusCode == 200 ? null : body['error'],
      info: response.statusCode == 200 ? body['info'] : null,
    );
  }

  ConfirmLoginAuthApiResponse toConfirmLoginAuthApiResponse(Response response) {
    final body = response.body;
    return ConfirmLoginAuthApiResponse(
      status: response.statusCode == 200
          ? ResponseStatus.success
          : ResponseStatus.error,
      error: response.statusCode == 200 ? null : body['error'],
      jwt: response.statusCode == 200 ? body['jwt'] : null,
      refreshToken: response.statusCode == 200 ? body['refresh_token'] : null,
    );
  }

  RefreshAuthApiResponse toRefreshAuthApiResponse(Response response) {
    final body = response.body;
    return RefreshAuthApiResponse(
      status: response.statusCode == 200
          ? ResponseStatus.success
          : ResponseStatus.error,
      error: response.statusCode == 200 ? null : body['error'],
      jwt: response.statusCode == 200 ? body['jwt'] : null,
      refreshToken: response.statusCode == 200 ? body['refresh_token'] : null,
    );
  }

  UserAuthApiResponse toUserAuthApiResponse(Response response) {
    final body = response.body;
    return UserAuthApiResponse(
      status: response.statusCode == 200
          ? ResponseStatus.success
          : ResponseStatus.error,
      error: response.statusCode == 200 ? null : body['error'],
      userId: response.statusCode == 200 ? body['user_id'] : null,
    );
  }
}
