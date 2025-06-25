import 'package:auth/services/store/i_config_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareStore(ProviderContainer ref) async {
  final configStore = ref.read(configStoreProvider);
  await configStore.open();
}
