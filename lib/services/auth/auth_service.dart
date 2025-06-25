import 'dart:async';

import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/services/auth/i_config_auth_service.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService implements IConfigAuthService {
  final Ref _ref;
  Timer? _timer;

  AuthService(this._ref);

  IAuthManager get _authManager => _ref.read(authManagerProvider);
  IUserState get _userState => _ref.read(userStateProvider);

  @override
  Future<bool> load() async {
    final result = await _authManager.load();
    _onCheckExpire();
    _timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => _onCheckExpire());
    return result;
  }

  void _onCheckExpire() {
    if (_userState.expiresAt?.isBefore(DateTime.now()) ?? false) {
      _authManager.refresh();
    }
  }

  void dispose() {
    _timer?.cancel();
  }
}
