import 'package:auth/entities/local/user_state/prepare_i_user_state_entity_repository.dart';
import 'package:auth/entities/local/settings/prepare_i_settings_entity_repository.dart';
import 'package:auth/services/auth/prepare_auth_service.dart';
import 'package:auth/services/store/prepare_i_store.dart';
import 'package:auth/services/translation/prepare_i_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Core {
  Future<Widget> configureApp(Widget app) async {
    final container = ProviderContainer();

    await _prepareApp(container);

    return UncontrolledProviderScope(
      container: container,
      child: app,
    );
  }

  Future<void> _prepareApp(ProviderContainer container) async {
    WidgetsFlutterBinding.ensureInitialized();

    await prepareStore(container);
    await prepareUserStateEntityRepository(container);
    await prepareSettingsEntityRepository(container);
    await prepareAuthService(container);
    await prepareTranslation(container);
  }
}
