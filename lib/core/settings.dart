import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = Provider<Settings>((ref) {
  return Settings(
    isDebug: true,
    isUseServer: true,
  );
});

class Settings {
  final bool isDebug;
  final bool isUseServer;

  Settings({
    required this.isDebug,
    required this.isUseServer,
  });
}
