import 'package:auth/pages/confirm/translation/confirm_page_translation_type.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:get/get.dart';

class ConfirmPageTranslation {
  static String get verification =>
      ConfirmPageTranslationType.verification.key.tr;
  static String get enterCode => ConfirmPageTranslationType.enterCode.key.tr;
  static String get resendCode => ConfirmPageTranslationType.resendCode.key.tr;
  static String resendCodeIn(int seconds) =>
      ConfirmPageTranslationType.resendCodeIn.key
          .trParams({'seconds': seconds.toString()});
  static String get verify => ConfirmPageTranslationType.verify.key.tr;

  static Map<String, Map<String, String>> get translations => {
        TranslationType.en.languageCode: {
          ConfirmPageTranslationType.verification.key: 'Verification',
          ConfirmPageTranslationType.enterCode.key:
              'Enter the code sent to your email ',
          ConfirmPageTranslationType.resendCode.key: 'Resend code',
          ConfirmPageTranslationType.resendCodeIn.key:
              'Resend code in @seconds seconds',
          ConfirmPageTranslationType.verify.key: 'Verify',
        },
        TranslationType.ru.languageCode: {
          ConfirmPageTranslationType.verification.key: 'Подтверждение',
          ConfirmPageTranslationType.enterCode.key:
              'Введите код, отправленный на ваш email ',
          ConfirmPageTranslationType.resendCode.key: 'Повторная отправка кода',
          ConfirmPageTranslationType.resendCodeIn.key:
              'Повторная отправка кода через @seconds секунд',
          ConfirmPageTranslationType.verify.key: 'Подтвердить',
        },
      };
}
