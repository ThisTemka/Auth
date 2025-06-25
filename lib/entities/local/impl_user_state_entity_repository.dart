import 'package:auth/entities/local/user_state_entity_repository.dart';
import 'package:auth/services/store/i_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final implUserStateEntityRepositoryProvider =
    Provider.autoDispose<UserStateEntityRepository>((ref) {
  final store = ref.watch(storeProvider);
  return UserStateEntityRepository(ref, store);
});
