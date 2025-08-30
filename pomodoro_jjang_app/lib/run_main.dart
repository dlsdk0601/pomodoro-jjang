import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pomodoro_jjang_app/view/block.dart';
import 'package:pomodoro_jjang_app/view/splash.dart';

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

  await SplashView.initialize();

  blockInitialize();

  Application.run();
}
