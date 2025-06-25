import 'dart:async';

import 'package:auth/api/auth/i_auth_api.dart';
import 'package:auth/api/response_status.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_repository.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_factory.dart';
import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthManager implements IAuthManager {
  final Ref _ref;

  AuthManager(this._ref);

  IUserState get _userState => _ref.read(userStateProvider);
  set _userState(IUserState user) =>
      _ref.read(userStateProvider.notifier).state = user;

  IUserStateEntityFactory get _userStateEntityFactory =>
      _ref.read(userStateEntityFactoryProvider);
  IUserStateEntityRepository get _userStateEntityRepository =>
      _ref.read(userStateEntityRepositoryProvider);

  IAuthApi get _authApi => _ref.read(authApiProvider);
  IRouter get _router => _ref.read(routerProvider);

  @override
  Future<bool> load() async {
    final userStateEntity = await _userStateEntityRepository.load();
    final id = userStateEntity.token == ''
        ? null
        : await _authApi.user(userStateEntity.token);
    _userState = _userState.copyWith(
      id: id?.userId,
      token: userStateEntity.token,
      refreshToken: userStateEntity.refreshToken,
      isExpiresAt: userStateEntity.expiresAt != null,
      expiresAt: userStateEntity.expiresAt,
    );
    return true;
  }

  @override
  Future<bool> login(String email) async {
    final response = await _authApi.login(email);
    if (response.status == ResponseStatus.success) {
      _userState = _userState.copyWith(email: email);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> confirm(String code) async {
    final response = await _authApi.confirm(_userState.email!, code);
    if (response.status == ResponseStatus.success) {
      _userState = _userState.copyWith(
        token: response.jwt,
        refreshToken: response.refreshToken,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      final userStateEntity = _userStateEntityFactory(
        token: response.jwt!,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        refreshToken: response.refreshToken!,
      );
      final saveResult = await _userStateEntityRepository.save(userStateEntity);
      if (!saveResult) return false;
      final id = await _authApi.user(_userState.token!);
      _userState = _userState.copyWith(id: id.userId);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> refresh() async {
    final response = await _authApi.refresh(_userState.refreshToken!);
    if (response.status == ResponseStatus.success) {
      _userState = _userState.copyWith(
        token: response.jwt,
        refreshToken: response.refreshToken,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      final userStateEntity = _userStateEntityFactory(
        token: response.jwt!,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        refreshToken: response.refreshToken!,
      );
      final saveResult = await _userStateEntityRepository.save(userStateEntity);
      if (!saveResult) return false;
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    _ref.invalidate(userStateProvider);
    final dropResult = await _userStateEntityRepository.drop();
    if (!dropResult) return false;
    _router.navigateOn(RoutePagePaths.login);
    return true;
  }
}
