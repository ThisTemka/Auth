import 'package:auth/entities/local/settings/i_config_settings_entity_repository.dart';
import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/i_settings_entity_repository.dart';
import 'package:auth/entities/local/settings/settings_mapper.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth/services/store/i_store.dart';

class SettingsEntityRepository
    implements ISettingsEntityRepository, IConfigSettingsEntityRepository {
  static const id = 0;
  final Ref ref;
  final IStore store;
  final SettingsMapper mapper = SettingsMapper();

  SettingsEntityRepository(this.ref, this.store);

  @override
  Future<void> save(ISettingsEntity entity) async {
    final json = mapper.toSettingsJson(entity);
    await store.save<ISettingsEntity>(id, json);
  }

  @override
  Future<ISettingsEntity> load() async {
    final entity = await store.load<ISettingsEntity>(id);
    return mapper.toSettingsEntity(entity!);
  }

  @override
  Future<bool> has() async {
    final entity = await store.load<ISettingsEntity>(id);
    return entity != null;
  }

  @override
  Future<void> setTranslationType(TranslationType translationType) async {
    final entity = await load();
    final newEntity = entity.copyWith(translationType: translationType);
    await save(newEntity);
  }
}
