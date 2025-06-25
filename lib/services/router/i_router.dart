import 'package:auth/services/router/impl_router.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final routerProvider =
    Provider.autoDispose<IRouter>((ref) => ref.watch(implRouterProvider));

abstract interface class IRouter {
  void navigateTo(RoutePagePaths route, {dynamic arguments});
  void navigateOn(RoutePagePaths route, {dynamic arguments});
  void navigateBack();
}
