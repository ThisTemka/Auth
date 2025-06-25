import 'package:auth/api/response_status.dart';

class RefreshAuthApiResponse {
  final ResponseStatus status;
  final String? error;
  final String? jwt;
  final String? refreshToken;

  RefreshAuthApiResponse({
    required this.status,
    this.error,
    this.jwt,
    this.refreshToken,
  });
}
