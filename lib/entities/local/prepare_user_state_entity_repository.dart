import 'package:auth/entities/local/i_config_user_state_entity_repository.dart';
import 'package:auth/entities/local/i_user_state_entity_factory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareUserStateEntityRepository(ProviderContainer ref) async {
  final repository = ref.read(configUserStateEntityRepositoryProvider);
  if (!await repository.has()) {
    final factory = ref.read(userStateEntityFactoryProvider);
    final userStateEntity = factory();
    await repository.save(userStateEntity);
  }
}
