import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pomodoro_jjang_app/view/color.dart';

class BlockView extends HookWidget {
  const BlockView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final completer = Completer();
      block(() => completer.future);

      return () {
        completer.complete();
      };
    }, []);
    return const SizedBox.shrink();
  }
}

int _counter = 0;

Future<T> block<T>(Future<T> Function() body, {bool useBlock = true}) async {
  if (!useBlock) {
    return await body();
  }

  if (_counter++ == 0) {
    EasyLoading.show();
  }

  try {
    return await body();
  } finally {
    if (--_counter == 0) {
      EasyLoading.dismiss();
    }
  }
}

void blockInitialize() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle
        .custom // 커스텀 스타일 적용
    ..indicatorColor = blue_001
    ..textColor = blue_001
    ..backgroundColor = Colors
        .transparent // 배경 투명
    ..boxShadow = <BoxShadow>[]
    ..indicatorWidget = const CircularProgressIndicator()
    ..maskType = EasyLoadingMaskType
        .clear // 검은 배경 제거
    ..userInteractions =
        false // 로딩 중에도 UI 터치 불가능
    ..dismissOnTap = false;
}
