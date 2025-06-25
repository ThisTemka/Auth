import 'package:auth/services/store/impl_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configStoreProvider = Provider.autoDispose<IConfigStore>((ref) {
  return ref.watch(implStoreProvider);
});

abstract interface class IConfigStore {
  Future<void> open();
}
