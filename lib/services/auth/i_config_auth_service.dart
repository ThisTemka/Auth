import 'package:auth/services/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configAuthServiceProvider =
    Provider.autoDispose<IConfigAuthService>((ref) {
  final authService = AuthService(ref);
  ref.onDispose(() {
    authService.dispose();
  });
  return authService;
});

abstract interface class IConfigAuthService {
  Future<bool> load();
}
