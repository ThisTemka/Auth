import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/settings_entity.dart';
import 'package:auth/services/translation/translation_type.dart';

class SettingsMapper {
  ISettingsEntity toSettingsEntity(Map<String, dynamic> json) {
    return SettingsEntity(
      id: json['id'],
      translationType: TranslationType.values.firstWhere(
        (e) => e.name == json['translationType'],
      ),
    );
  }

  Map<String, dynamic> toSettingsJson(ISettingsEntity entity) {
    return {
      'id': entity.id,
      'translationType': entity.translationType.name,
    };
  }
}
