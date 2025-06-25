import 'package:auth/services/router/i_router_config.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth/states/user/i_user_state.dart';

class AuthRouterConfigWrapper implements IRouterConfig {
  final Ref ref;
  final IRouterConfig router;

  AuthRouterConfigWrapper(this.ref, this.router);

  @override
  String get initialRoute => _getInitialRoute();

  @override
  List<GetPage<dynamic>> get routes => router.routes;

  String _getInitialRoute() {
    final userState = ref.read(userStateProvider);
    if (userState.token != '') {
      return RoutePagePaths.content.path;
    } else {
      return RoutePagePaths.login.path;
    }
  }
}
