import 'dart:convert';

import 'package:auth/api/auth/auth_api_mapper.dart';
import 'package:auth/api/auth/i_auth_api.dart';
import 'package:auth/api/auth/responses/login_auth_api_response.dart';
import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:get/get.dart';

class AuthApi extends GetConnect implements IAuthApi {
  final AuthApiMapper mapper = AuthApiMapper();
  final String path = 'https://d5dsstfjsletfcftjn3b.apigw.yandexcloud.net';

  @override
  Future<LoginAuthApiResponse> login(String email) async {
    final response = await post(
      '$path/login',
      jsonEncode({'email': email}),
    );
    return mapper.toLoginAuthApiResponse(response);
  }

  @override
  Future<ConfirmLoginAuthApiResponse> confirm(String email, String code) async {
    final response = await post(
      '$path/confirm_code',
      jsonEncode({'email': email, 'code': code}),
    );
    return mapper.toConfirmLoginAuthApiResponse(response);
  }

  @override
  Future<RefreshAuthApiResponse> refresh(String refreshToken) async {
    final response = await post(
      '$path/refresh_token',
      jsonEncode({'token': refreshToken}),
    );
    return mapper.toRefreshAuthApiResponse(response);
  }

  @override
  Future<UserAuthApiResponse> user(String token) async {
    final response = await get(
      '$path/auth',
      headers: {'Auth': 'Bearer $token'},
    );
    return mapper.toUserAuthApiResponse(response);
  }
}
