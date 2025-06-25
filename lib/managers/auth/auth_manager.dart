import 'dart:async';

import 'package:auth/api/auth/i_auth_api.dart';
import 'package:auth/api/response_status.dart';
import 'package:auth/entities/local/i_user_state_entity_repository.dart';
import 'package:auth/entities/local/i_user_state_entity_factory.dart';
import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/states/user/i_user_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthManager implements IAuthManager {
  final Ref ref;
  Timer? timer;

  AuthManager(this.ref);

  IUserState get userState => ref.read(userStateProvider);
  set userState(IUserState user) =>
      ref.read(userStateProvider.notifier).state = user;

  IUserStateEntityFactory get userStateEntityFactory =>
      ref.read(userStateEntityFactoryProvider);
  IUserStateEntityRepository get userStateEntityRepository =>
      ref.read(userStateEntityRepositoryProvider);

  IAuthApi get authApi => ref.read(authApiProvider);
  IRouter get router => ref.read(routerProvider);

  @override
  Future<bool> load() async {
    final userStateEntity = await userStateEntityRepository.load();
    final id = userStateEntity.token == ''
        ? null
        : await authApi.user(userStateEntity.token);
    userState = userState.copyWith(
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
    final response = await authApi.login(email);
    if (response.status == ResponseStatus.success) {
      userState = userState.copyWith(email: email);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> confirm(String code) async {
    final response = await authApi.confirm(userState.email!, code);
    if (response.status == ResponseStatus.success) {
      userState = userState.copyWith(
        token: response.jwt,
        refreshToken: response.refreshToken,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      final userStateEntity = userStateEntityFactory(
        token: response.jwt,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        refreshToken: response.refreshToken,
      );
      userStateEntityRepository.save(userStateEntity);
      final id = await authApi.user(userState.token!);
      userState = userState.copyWith(id: id.userId);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> refresh() async {
    final response = await authApi.refresh(userState.refreshToken!);
    if (response.status == ResponseStatus.success) {
      userState = userState.copyWith(
        token: response.jwt,
        refreshToken: response.refreshToken,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      final userStateEntity = userStateEntityFactory(
        token: response.jwt,
        isExpiresAt: true,
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        refreshToken: response.refreshToken,
      );
      userStateEntityRepository.save(userStateEntity);
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    ref.invalidate(userStateProvider);
    userStateEntityRepository.drop();
    router.navigateOn(RoutePagePaths.login);
    return true;
  }
}
