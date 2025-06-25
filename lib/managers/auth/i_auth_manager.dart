import 'package:auth/managers/auth/auth_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authManagerProvider = Provider.autoDispose<IAuthManager>((ref) {
  return AuthManager(ref);
});

abstract interface class IAuthManager {
  Future<bool> load();
  Future<bool> login(String email);
  Future<bool> confirm(String code);
  Future<bool> refresh();
  Future<bool> logout();
}
