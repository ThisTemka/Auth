import 'package:auth/services/auth/i_config_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareAuthService(ProviderContainer container) async {
  final authService = container.read(configAuthServiceProvider);
  final result = await authService.load();
  if (!result) throw Exception('Auth service load failed');
}
