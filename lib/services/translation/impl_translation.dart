import 'package:auth/services/translation/translation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final implTranslationProvider = Provider<Translation>((ref) {
  return Translation(ref);
});
