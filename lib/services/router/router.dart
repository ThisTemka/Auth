import 'package:auth/pages/confirm/confirm_page.dart';
import 'package:auth/pages/login/login_page.dart';
import 'package:auth/pages/content/content_page.dart';
import 'package:auth/services/router/i_router.dart';
import 'package:auth/services/router/i_router_config.dart';
import 'package:auth/services/router/route_page_paths.dart';
import 'package:get/get.dart';

class Router implements IRouter, IRouterConfig {
  @override
  String get initialRoute => RoutePagePaths.login.path;

  @override
  final List<GetPage> routes = [
    GetPage(
      name: RoutePagePaths.login.path,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RoutePagePaths.content.path,
      page: () => const ContentPage(),
    ),
    GetPage(
      name: RoutePagePaths.confirm.path,
      page: () => const ConfirmPage(),
    ),
  ];

  @override
  void navigateTo(RoutePagePaths route, {dynamic arguments}) {
    Get.toNamed(route.path, arguments: arguments);
  }

  @override
  void navigateOn(RoutePagePaths route, {dynamic arguments}) {
    Get.offNamed(route.path, arguments: arguments);
  }

  @override
  void navigateBack() {
    Get.back();
  }
}
