import 'package:auth/services/store/store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final implStoreProvider = Provider<Store>((ref) {
  return Store();
});
