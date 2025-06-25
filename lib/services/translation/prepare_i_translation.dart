import 'package:auth/services/translation/i_config_translation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> prepareTranslation(ProviderContainer ref) async {
  final translation = ref.read(configTranslationProvider);
  await translation.load();
}
