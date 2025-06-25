import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/impl_settings_entity_repository.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsEntityRepositoryProvider =
    Provider.autoDispose<ISettingsEntityRepository>((ref) {
  return ref.watch(implSettingsEntityRepositoryProvider);
});

abstract interface class ISettingsEntityRepository {
  Future<bool> setTranslationType(TranslationType translationType);
  Future<ISettingsEntity> load();
}
