import 'package:auth/entities/local/settings/i_config_settings_entity_repository.dart';
import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/i_settings_entity_repository.dart';
import 'package:auth/entities/local/settings/settings_mapper.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:auth/services/store/i_store.dart';

class SettingsEntityRepository
    implements ISettingsEntityRepository, IConfigSettingsEntityRepository {
  static const int _id = 0;

  final IStore _store;
  final SettingsMapper _mapper;

  SettingsEntityRepository(this._store, this._mapper);

  @override
  Future<bool> save(ISettingsEntity entity) async {
    final json = _mapper.toSettingsJson(entity);
    return await _store.save<ISettingsEntity>(_id, json);
  }

  @override
  Future<ISettingsEntity> load() async {
    final entity = await _store.load<ISettingsEntity>(_id);
    return _mapper.toSettingsEntity(entity!);
  }

  @override
  Future<bool> has() async {
    final entity = await _store.load<ISettingsEntity>(_id);
    return entity != null;
  }

  @override
  Future<bool> setTranslationType(TranslationType translationType) async {
    final entity = await load();
    final newEntity = entity.copyWith(translationType: translationType);
    return await save(newEntity);
  }
}
