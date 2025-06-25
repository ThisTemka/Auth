import 'package:auth/entities/local/i_config_user_state_entity_repository.dart';
import 'package:auth/entities/local/i_user_state_entity.dart';
import 'package:auth/entities/local/i_user_state_entity_repository.dart';
import 'package:auth/entities/local/i_user_state_entity_factory.dart';
import 'package:auth/entities/local/user_state_mapper.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStateEntityRepository
    implements IUserStateEntityRepository, IConfigUserStateEntityRepository {
  static const int id = 1;

  final Ref ref;
  final IStore store;
  final UserStateMapper mapper = UserStateMapper();

  UserStateEntityRepository(this.ref, this.store);

  IUserStateEntityFactory get factory =>
      ref.read(userStateEntityFactoryProvider);

  @override
  Future<IUserStateEntity> load() async {
    final entity = await store.load<IUserStateEntity>(id);
    return mapper.toUserStateEntity(entity!);
  }

  @override
  Future<bool> has() async {
    final entity = await store.load<IUserStateEntity>(id);
    return entity != null;
  }

  @override
  Future<void> save(IUserStateEntity entity) async {
    final json = mapper.toUserStateJson(entity);
    await store.save<IUserStateEntity>(id, json);
  }

  @override
  Future<void> drop() async {
    final entity = factory();
    final json = mapper.toUserStateJson(entity);
    await store.save<IUserStateEntity>(id, json);
  }
}
