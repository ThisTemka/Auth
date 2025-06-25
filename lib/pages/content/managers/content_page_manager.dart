import 'package:auth/managers/auth/i_auth_manager.dart';
import 'package:auth/pages/content/managers/i_content_page_manager.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentPageManager implements IContentPageManager {
  final Ref ref;

  ContentPageManager(this.ref);

  IAuthManager get authManager => ref.read(authManagerProvider);
  IRouter get router => ref.read(routerProvider);

  @override
  void logout() {
    authManager.logout();
    router.navigateOn(RoutePagePaths.login);
  }

  @override
  void back() {
    router.navigateBack();
  }
}
