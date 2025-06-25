import 'dart:async';

import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/services/auth/i_config_auth_service.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService implements IConfigAuthService {
  final Ref ref;
  Timer? timer;

  AuthService(this.ref);

  IAuthManager get authManager => ref.read(authManagerProvider);
  IUserState get userState => ref.read(userStateProvider);

  @override
  Future<bool> load() async {
    final result = await authManager.load();
    _onCheckExpire();
    timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => _onCheckExpire());
    return result;
  }

  void _onCheckExpire() {
    if (userState.expiresAt?.isBefore(DateTime.now()) ?? false) {
      authManager.refresh();
    }
  }
}
