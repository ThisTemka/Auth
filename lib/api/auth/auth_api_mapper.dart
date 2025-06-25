import 'package:auth/api/auth/auth_api_response_data.dart';
import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:auth/api/response_status.dart';
import 'package:auth/api/response_code.dart';
import 'package:get/get.dart';

import 'responses/login_auth_api_response.dart';

class AuthApiMapper {
  LoginAuthApiResponse toLoginAuthApiResponse(Response response) {
    if (response.statusCode != ResponseCode.success.code) {
      return LoginAuthApiResponse(
        status: ResponseStatus.error,
        error: AuthApiResponseData.error.getFrom(response),
      );
    }
    return LoginAuthApiResponse(
      status: ResponseStatus.success,
      info: AuthApiResponseData.info.getFrom(response),
    );
  }

  ConfirmLoginAuthApiResponse toConfirmLoginAuthApiResponse(Response response) {
    if (response.statusCode != ResponseCode.success.code) {
      return ConfirmLoginAuthApiResponse(
        status: ResponseStatus.error,
        error: AuthApiResponseData.error.getFrom(response),
      );
    }
    return ConfirmLoginAuthApiResponse(
      status: ResponseStatus.success,
      jwt: AuthApiResponseData.jwt.getFrom(response),
      refreshToken: AuthApiResponseData.refreshToken.getFrom(response),
    );
  }

  RefreshAuthApiResponse toRefreshAuthApiResponse(Response response) {
    if (response.statusCode != ResponseCode.success.code) {
      return RefreshAuthApiResponse(
        status: ResponseStatus.error,
        error: AuthApiResponseData.error.getFrom(response),
      );
    }
    return RefreshAuthApiResponse(
      status: ResponseStatus.success,
      jwt: AuthApiResponseData.jwt.getFrom(response),
      refreshToken: AuthApiResponseData.refreshToken.getFrom(response),
    );
  }

  UserAuthApiResponse toUserAuthApiResponse(Response response) {
    if (response.statusCode != ResponseCode.success.code) {
      return UserAuthApiResponse(
        status: ResponseStatus.error,
        error: AuthApiResponseData.error.getFrom(response),
      );
    }
    return UserAuthApiResponse(
      status: ResponseStatus.success,
      userId: AuthApiResponseData.userId.getFrom(response),
    );
  }
}
