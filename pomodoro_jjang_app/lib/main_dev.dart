import 'package:logger/logger.dart';
import 'package:pomodoro_jjang_app/main.dart';
import 'package:pomodoro_jjang_app/run_main.dart';

import 'config.dart';

void main() {
  runDevMain(
    initialize: () {
      logger.i('running main_dev.dart');
    },
  );
}

void runDevMain({
  RunType runType = RunType.dev,
  Level level = Level.debug,
  required void Function() initialize,
}) {
  runPrdMain(
    runType: runType,
    level: level,
    initialize: () {
      initialize();
      logger.i('initializing development main');
    },
  );
}
