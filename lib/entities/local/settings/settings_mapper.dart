import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/i_settings_entity_factory.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsMapperProvider = Provider.autoDispose<SettingsMapper>((ref) {
  final factory = ref.watch(settingsEntityFactoryProvider);
  return SettingsMapper(factory);
});

class SettingsMapper {
  final ISettingsEntityFactory _factory;

  SettingsMapper(this._factory);

  ISettingsEntity toSettingsEntity(Map<String, dynamic> json) {
    return _factory(
      translationType: TranslationType.values.firstWhere(
        (e) => e.name == json['translationType'],
      ),
    );
  }

  Map<String, dynamic> toSettingsJson(ISettingsEntity entity) {
    return {
      'translationType': entity.translationType.name,
    };
  }
}
