import 'package:auth/entities/local/user_state/i_user_state_entity.dart';
import 'package:auth/entities/local/user_state/impl_user_state_entity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateEntityRepositoryProvider =
    Provider.autoDispose<IUserStateEntityRepository>((ref) {
  return ref.watch(implUserStateEntityRepositoryProvider);
});

abstract interface class IUserStateEntityRepository {
  Future<IUserStateEntity> load();
  Future<bool> save(IUserStateEntity entity);
  Future<bool> drop();
}
