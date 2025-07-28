import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_jjang_app/screen/home/home.dart';

class Application extends HookConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }

  static void run() {
    _runWithKey();
  }

  // keep reference to last providerKey and applicationKey
  static UniqueKey? _lastProviderKey;
  static UniqueKey? _lastApplicationKey;

  static void _runWithKey({UniqueKey? providerKey, UniqueKey? applicationKey}) {
    _lastProviderKey = providerKey;
    _lastApplicationKey = applicationKey;

    runApp(
      ProviderScope(
        key: _lastProviderKey,
        child: Application(key: _lastApplicationKey),
      ),
    );
  }
}
