import 'package:auth/api/response_status.dart';

class LoginAuthApiResponse {
  ResponseStatus status;
  String? error;
  String? info;

  LoginAuthApiResponse({
    required this.status,
    this.error,
    this.info,
  });
}
