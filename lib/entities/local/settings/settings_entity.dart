import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/services/translation/translation_type.dart';

class SettingsEntity implements ISettingsEntity {
  @override
  final int id;
  @override
  final TranslationType translationType;

  SettingsEntity({
    required this.id,
    required this.translationType,
  });

  factory SettingsEntity.create({
    required TranslationType translationType,
  }) {
    return SettingsEntity(
      id: 0,
      translationType: translationType,
    );
  }

  @override
  SettingsEntity copyWith({
    int? id,
    TranslationType? translationType,
  }) {
    return SettingsEntity.create(
      translationType: translationType ?? this.translationType,
    );
  }
}
