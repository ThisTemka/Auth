import 'package:auth/entities/local/user_state/i_config_user_state_entity_repository.dart';
import 'package:auth/entities/local/user_state/i_user_state_entity_factory.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareUserStateEntityRepository(ProviderContainer ref) async {
  final repository = ref.read(configUserStateEntityRepositoryProvider);
  if (await repository.has()) return;
  final factory = ref.read(userStateEntityFactoryProvider);
  final userStateEntity = factory();
  await repository.save(userStateEntity);
}
