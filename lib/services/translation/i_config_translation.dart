import 'package:auth/services/translation/impl_translation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configTranslationProvider =
    Provider.autoDispose<IConfigTranslation>((ref) {
  return ref.watch(implTranslationProvider);
});

abstract interface class IConfigTranslation {
  Future<void> load();
}
