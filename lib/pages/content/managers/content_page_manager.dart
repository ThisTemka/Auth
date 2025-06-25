import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/content/managers/i_content_page_manager.dart';
import 'package:auth/pages/content/states/data/i_content_page_data_state.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:auth/services/translation/translation_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentPageManager implements IContentPageManager {
  final Ref _ref;

  ContentPageManager(this._ref);

  IContentPageDataState get _pageDataState =>
      _ref.read(contentPageDataStateProvider);
  set _pageDataState(IContentPageDataState state) =>
      _ref.read(contentPageDataStateProvider.notifier).state = state;

  IAuthManager get _authManager => _ref.read(authManagerProvider);
  IRouter get _router => _ref.read(routerProvider);
  ITranslation get _translation => _ref.read(translationProvider);

  @override
  void logout() {
    _pageDataState = _pageDataState.copyWith(isLoading: true);
    _authLogout();
  }

  Future<void> _authLogout() async {
    final result = await _authManager.logout();
    if (result) {
      _router.navigateOn(RoutePagePaths.login);
    }
    _pageDataState = _pageDataState.copyWith(isLoading: false);
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
