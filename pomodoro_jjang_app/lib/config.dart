import 'dart:io';

import 'package:logger/logger.dart';
import 'package:pomodoro_jjang_app/run_main.dart';

class Config {
  Config._();

  var runType = RunType.prd;

  var loggerLevel = Level.info;

  var splashFadeDuration = const Duration(milliseconds: 1000);

  String? routerInitialLocation;

  Uri apiServer = Uri.parse('http://localhost:5001/api');
}

final config = Config._();

final logger = Logger(
  level: config.loggerLevel,
  // https://github.com/flutter/flutter/issues/64491
  printer: PrefixPrinter(PrettyPrinter(colors: Platform.isAndroid)),
);
