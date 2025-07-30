import 'package:logger/logger.dart';
import 'package:pomodoro_jjang_app/run_main.dart';

import 'config.dart';

void main() {
  runPrdMain(
    initialize: () {
      logger.i('running main_prd.dart');
    },
  );
}

void runPrdMain({
  RunType runType = RunType.prd,
  Level level = Level.info,
  required void Function() initialize,
}) {
  runMain(
    runType: runType,
    level: level,
    initialize: () {
      config.apiServer = config.apiServer.replace(
        host: 'pomodoro-jjang.dev-ina.pe.kr/api',
        scheme: 'https',
        port: 443,
      );
      initialize();
      logger.i('initializing production main');
    },
  );
}
