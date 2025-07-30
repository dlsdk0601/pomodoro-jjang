import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'application.dart';
import 'config.dart';

enum RunType { prd, dev, local }

Future<void> runMain({
  RunType runType = RunType.prd,
  Level level = Level.info,
  required void Function() initialize,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  config.runType = runType;
  config.loggerLevel = level;

  initialize();
  logger.i('initializing main');

  // await SplashView.initialize();

  Application.run();
}
