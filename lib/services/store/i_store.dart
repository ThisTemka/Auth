import 'package:auth/entities/i_entity.dart';
import 'package:auth/services/store/impl_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final storeProvider = Provider.autoDispose<IStore>((ref) {
  return ref.watch(implStoreProvider);
});

abstract interface class IStore {
  Future<bool> save<T extends IEntity>(int key, Map<String, dynamic> entity);
  Future<Map<String, dynamic>?> load<T extends IEntity>(int key);
}
