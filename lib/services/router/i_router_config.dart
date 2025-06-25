import 'package:auth/services/router/auth_config_router_wrapper.dart';
import 'package:auth/services/router/impl_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final routerConfigProvider = Provider.autoDispose<IRouterConfig>((ref) {
  final router = ref.watch(implRouterProvider);
  return AuthRouterConfigWrapper(ref, router);
});

abstract interface class IRouterConfig {
  String get initialRoute;
  List<GetPage> get routes;
}
