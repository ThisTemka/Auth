import 'package:auth/pages/content/translation/content_page_translation_type.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:get/get.dart';

class ContentPageTranslation {
  static String get hi => ContentPageTranslationType.hi.key.tr;
  static String get yourId => ContentPageTranslationType.yourId.key.tr;
  static String get logoutButton =>
      ContentPageTranslationType.logoutButton.key.tr;
  static String get confirmLogoutTitle =>
      ContentPageTranslationType.confirmLogoutTitle.key.tr;
  static String get confirmLogout =>
      ContentPageTranslationType.confirmLogout.key.tr;
  static String get cancel => ContentPageTranslationType.cancel.key.tr;

  static Map<String, Map<String, String>> get translations => {
        TranslationType.en.languageCode: {
          ContentPageTranslationType.hi.key: 'Hi!',
          ContentPageTranslationType.yourId.key: 'Your ID',
          ContentPageTranslationType.logoutButton.key: 'Log Out',
          ContentPageTranslationType.confirmLogoutTitle.key: 'Confirm Logout',
          ContentPageTranslationType.confirmLogout.key:
              'Are you sure you want to log out?',
          ContentPageTranslationType.cancel.key: 'Cancel',
        },
        TranslationType.ru.languageCode: {
          ContentPageTranslationType.hi.key: 'Привет!',
          ContentPageTranslationType.yourId.key: 'Ваш ID',
          ContentPageTranslationType.logoutButton.key: 'Выйти',
          ContentPageTranslationType.confirmLogoutTitle.key:
              'Подтверждение выхода',
          ContentPageTranslationType.confirmLogout.key:
              'Вы уверены, что хотите выйти?',
          ContentPageTranslationType.cancel.key: 'Отмена',
        },
      };
}
