import 'package:auth/core/app.dart';
import 'package:flutter/material.dart';
import 'package:auth/core/core.dart';

void main() async {
  final core = Core();
  final app = App();

  final configuredApp = await core.configureApp(app);

  runApp(configuredApp);
}
