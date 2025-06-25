import 'package:auth/api/response_status.dart';

class UserAuthApiResponse {
  final ResponseStatus status;
  final String? error;
  final String? userId;

  UserAuthApiResponse({
    required this.status,
    this.error,
    this.userId,
  });
}
