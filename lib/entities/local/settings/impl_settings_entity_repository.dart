import 'package:auth/entities/local/settings/settings_entity_repository.dart';
import 'package:auth/entities/local/settings/settings_mapper.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final implSettingsEntityRepositoryProvider =
    Provider.autoDispose<SettingsEntityRepository>((ref) {
  final store = ref.watch(storeProvider);
  final mapper = ref.watch(settingsMapperProvider);
  return SettingsEntityRepository(store, mapper);
});
