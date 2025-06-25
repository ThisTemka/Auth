import 'package:auth/entities/local/settings/i_settings_entity_repository.dart';
import 'package:auth/pages/confirm/translation/confirm_page_translation.dart';
import 'package:auth/pages/content/translation/content_page_translation.dart';
import 'package:auth/pages/login/translation/login_page_translation.dart';
import 'package:auth/services/translation/i_config_translation.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Translation implements ITranslation, IConfigTranslation, Translations {
  final Ref ref;
  late TranslationType? _translationType;

  Translation(this.ref);

  ISettingsEntityRepository get settingsEntityRepository =>
      ref.read(settingsEntityRepositoryProvider);

  @override
  TranslationType get translationType => _translationType!;

  @override
  Map<String, Map<String, String>> get keys => {
        TranslationType.en.languageCode: {
          ...LoginPageTranslation
              .translations[TranslationType.en.languageCode]!,
          ...ConfirmPageTranslation
              .translations[TranslationType.en.languageCode]!,
          ...ContentPageTranslation
              .translations[TranslationType.en.languageCode]!,
        },
        TranslationType.ru.languageCode: {
          ...LoginPageTranslation
              .translations[TranslationType.ru.languageCode]!,
          ...ConfirmPageTranslation
              .translations[TranslationType.ru.languageCode]!,
          ...ContentPageTranslation
              .translations[TranslationType.ru.languageCode]!,
        },
      };

  @override
  Translations get translations => this;

  @override
  Future<void> load() async {
    final entity = await settingsEntityRepository.load();
    changeLanguage(entity.translationType);
  }

  @override
  void changeLanguage(TranslationType translationType) {
    _translationType = translationType;
    Get.updateLocale(translationType.locale);
    settingsEntityRepository.setTranslationType(translationType);
  }
}
