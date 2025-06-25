import 'package:auth/entities/local/settings/i_settings_entity.dart';
import 'package:auth/entities/local/settings/impl_settings_entity_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configSettingsEntityRepositoryProvider =
    Provider.autoDispose<IConfigSettingsEntityRepository>((ref) {
  return ref.watch(implSettingsEntityRepositoryProvider);
});

abstract interface class IConfigSettingsEntityRepository {
  Future<bool> save(ISettingsEntity entity);
  Future<bool> has();
}
