import 'package:auth/services/router/i_router_config.dart';
import 'package:auth/services/translation/i_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(routerConfigProvider);
    final translation = ref.read(translationProvider);

    return GetMaterialApp(
      initialRoute: router.initialRoute,
      getPages: router.routes,
      translations: translation.translations,
      onInit: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
      onDispose: () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      },
    );
  }
}
