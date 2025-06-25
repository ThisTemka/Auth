import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/settings_entity.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsEntityFactoryProvider =
    Provider.autoDispose<ISettingsEntityFactory>((ref) {
  return SettingsEntity.create;
});

typedef ISettingsEntityFactory = ISettingsEntity Function({
  required TranslationType translationType,
});
