import 'package:auth/pages/confirm/managers/resend/confirm_page_resend_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final confirmPageResendManagerProvider =
    Provider.autoDispose<IConfirmPageResendManager>((ref) {
  final manager = ConfirmPageResendManager(ref);
  return manager;
});

abstract interface class IConfirmPageResendManager {
  void waitResendCode();
}
