import 'package:auth/entities/local/settings/settings_entity_repository.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final implSettingsEntityRepositoryProvider =
    Provider.autoDispose<SettingsEntityRepository>((ref) {
  final store = ref.watch(storeProvider);
  return SettingsEntityRepository(ref, store);
});
