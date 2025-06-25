import 'package:auth/api/response_status.dart';

class ConfirmLoginAuthApiResponse {
  ResponseStatus status;
  String? error;
  final String jwt;
  final String refreshToken;

  ConfirmLoginAuthApiResponse({
    required this.status,
    required this.error,
    required this.jwt,
    required this.refreshToken,
  });
}
