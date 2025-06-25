import 'package:auth/api/response_status.dart';

class UserAuthApiResponse {
  ResponseStatus status;
  String? error;
  final String userId;

  UserAuthApiResponse({
    required this.status,
    required this.error,
    required this.userId,
  });
}
