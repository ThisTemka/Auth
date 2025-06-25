import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/content/managers/i_content_page_manager.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentPageManager implements IContentPageManager {
  final Ref _ref;

  ContentPageManager(this._ref);

  IAuthManager get _authManager => _ref.read(authManagerProvider);
  IRouter get _router => _ref.read(routerProvider);
  ITranslation get _translation => _ref.read(translationProvider);

  @override
  void logout() {
    _authManager.logout();
    _router.navigateOn(RoutePagePaths.login);
  }

  @override
  void back() {
    _router.navigateBack();
  }

  @override
  TranslationType getTranslationType() {
    return _translation.translationType;
  }

  @override
  void changeTranslation(TranslationType translationType) {
    _translation.changeLanguage(translationType);
  }
}
