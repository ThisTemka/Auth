import 'package:auth/entities/local/settings/i_config_settings_entity_repository.dart';
import 'package:auth/entities/local/settings/i_settings_entity_factory.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareSettingsEntityRepository(ProviderContainer ref) async {
  final settingsEntityRepository =
      ref.read(configSettingsEntityRepositoryProvider);
  if (await settingsEntityRepository.has()) return;
  final factory = ref.read(settingsEntityFactoryProvider);
  final settingsEntity = factory(
    translationType: TranslationType.en,
  );
  await settingsEntityRepository.save(settingsEntity);
}
