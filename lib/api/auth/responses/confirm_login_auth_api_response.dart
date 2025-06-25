import 'package:auth/api/response_status.dart';

class ConfirmLoginAuthApiResponse {
  final ResponseStatus status;
  final String? error;
  final String? jwt;
  final String? refreshToken;

  ConfirmLoginAuthApiResponse({
    required this.status,
    this.error,
    this.jwt,
    this.refreshToken,
  });
}
