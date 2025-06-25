import 'package:auth/entities/local/i_user_state_entity.dart';
import 'package:auth/entities/local/impl_user_state_entity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userStateEntityRepositoryProvider =
    Provider.autoDispose<IUserStateEntityRepository>((ref) {
  return ref.watch(implUserStateEntityRepositoryProvider);
});

abstract interface class IUserStateEntityRepository {
  Future<IUserStateEntity> load();
  Future<void> save(IUserStateEntity entity);
  Future<void> drop();
}
