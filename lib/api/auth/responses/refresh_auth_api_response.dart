import 'package:auth/api/response_status.dart';

class RefreshAuthApiResponse {
  ResponseStatus status;
  String? error;
  final String jwt;
  final String refreshToken;

  RefreshAuthApiResponse({
    required this.status,
    required this.error,
    required this.jwt,
    required this.refreshToken,
  });
}
