import 'dart:convert';

import 'package:auth/api/auth/auth_api_mapper.dart';
import 'package:auth/api/auth/i_auth_api.dart';
import 'package:auth/api/auth/responses/login_auth_api_response.dart';
import 'package:auth/api/auth/responses/confirm_login_auth_api_response.dart';
import 'package:auth/api/auth/responses/refresh_auth_api_response.dart';
import 'package:auth/api/auth/responses/user_auth_api_response.dart';
import 'package:get/get.dart';

class AuthApi extends GetConnect implements IAuthApi {
  final AuthApiMapper _mapper = AuthApiMapper();
  final String _path = 'https://d5dsstfjsletfcftjn3b.apigw.yandexcloud.net';

  @override
  Future<LoginAuthApiResponse> login(String email) async {
    final response = await post(
      '$_path/login',
      jsonEncode({'email': email}),
    );
    return _mapper.toLoginAuthApiResponse(response);
  }

  @override
  Future<ConfirmLoginAuthApiResponse> confirm(String email, String code) async {
    final response = await post(
      '$_path/confirm_code',
      jsonEncode({'email': email, 'code': code}),
    );
    return _mapper.toConfirmLoginAuthApiResponse(response);
  }

  @override
  Future<RefreshAuthApiResponse> refresh(String refreshToken) async {
    final response = await post(
      '$_path/refresh_token',
      jsonEncode({'token': refreshToken}),
    );
    return _mapper.toRefreshAuthApiResponse(response);
  }

  @override
  Future<UserAuthApiResponse> user(String token) async {
    final response = await get(
      '$_path/auth',
      headers: {'Auth': 'Bearer $token'},
    );
    return _mapper.toUserAuthApiResponse(response);
  }
}
