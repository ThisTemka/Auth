import 'package:auth/pages/login/translation/login_page_translation_type.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:get/get.dart';

class LoginPageTranslation {
  static String get title => LoginPageTranslationType.login.key.tr;
  static String get welcome => LoginPageTranslationType.welcome.key.tr;
  static String get enterEmail => LoginPageTranslationType.enterEmail.key.tr;
  static String get enterEmailHint =>
      LoginPageTranslationType.enterEmailHint.key.tr;
  static String get loginButton => LoginPageTranslationType.loginButton.key.tr;

  static Map<String, Map<String, String>> get translations => {
        TranslationType.en.languageCode: {
          LoginPageTranslationType.login.key: 'Login',
          LoginPageTranslationType.welcome.key: 'Welcome back',
          LoginPageTranslationType.enterEmail.key: 'Enter your email',
          LoginPageTranslationType.enterEmailHint.key: 'Your email',
          LoginPageTranslationType.loginButton.key: 'Login',
        },
        TranslationType.ru.languageCode: {
          LoginPageTranslationType.login.key: 'Вход',
          LoginPageTranslationType.welcome.key: 'Добро пожаловать',
          LoginPageTranslationType.enterEmail.key: 'Введите ваш email',
          LoginPageTranslationType.enterEmailHint.key: 'Ваш email',
          LoginPageTranslationType.loginButton.key: 'Войти',
        },
      };
}
