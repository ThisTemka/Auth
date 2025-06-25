import 'package:auth/entities/local/user_state/i_config_user_state_entity_repository.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_repository.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_factory.dart';
import 'package:auth/entities/local/user_state/user_state_mapper.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserStateEntityRepository
    implements IUserStateEntityRepository, IConfigUserStateEntityRepository {
  static const int _id = 0;

  final Ref _ref;
  final IStore _store;
  final UserStateMapper _mapper;

  UserStateEntityRepository(this._ref, this._store, this._mapper);

  IUserStateEntityFactory get _factory =>
      _ref.read(userStateEntityFactoryProvider);

  @override
  Future<IUserStateEntity> load() async {
    final entity = await _store.load<IUserStateEntity>(_id);
    return _mapper.toUserStateEntity(entity!);
  }

  @override
  Future<bool> has() async {
    final entity = await _store.load<IUserStateEntity>(_id);
    return entity != null;
  }

  @override
  Future<bool> save(IUserStateEntity entity) async {
    final json = _mapper.toUserStateJson(entity);
    return await _store.save<IUserStateEntity>(_id, json);
  }

  @override
  Future<bool> drop() async {
    final entity = _factory();
    final json = _mapper.toUserStateJson(entity);
    return await _store.save<IUserStateEntity>(_id, json);
  }
}
