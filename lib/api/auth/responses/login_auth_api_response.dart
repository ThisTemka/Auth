import 'package:auth/api/response_status.dart';

class LoginAuthApiResponse {
  final ResponseStatus status;
  final String? error;
  final String? info;

  LoginAuthApiResponse({
    required this.status,
    this.error,
    this.info,
  });
}
