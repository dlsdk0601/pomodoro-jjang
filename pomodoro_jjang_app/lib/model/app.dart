import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config.dart';
import '../ex/storage.dart';

part 'app.freezed.dart';
part 'app.g.dart';

@riverpod
class App extends _$App {
  @override
  AppModel build() =>
      const AppModel(initialized: false, themeMode: ThemeMode.light);

  setInitialized() async {
    final mode = await storage.read(StorageKey.IS_DARK);
    ThemeMode themeMode = ThemeMode.light;
    switch (mode) {
      case 'ThemeMode.light':
        break;
      case 'ThemeMode.dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light;
        break;
    }

    await Future.delayed(config.splashFadeDuration);
    state = state.copyWith(initialized: true, themeMode: themeMode);
  }

  setThemeMode() {
    final currentMode = state.themeMode;
    final newMode = switch (currentMode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };

    storage.set(StorageKey.IS_DARK, newMode);
    state = state.copyWith(themeMode: newMode);
  }
}

@freezed
sealed class AppModel with _$AppModel {
  const factory AppModel({
    required bool initialized,
    required ThemeMode themeMode,
  }) = _AppModel;
}

extension ThemeModeExtension on ThemeMode {
  String get label {
    return switch (this) {
      ThemeMode.dark => "다크",
      ThemeMode.light => "라이트",
      ThemeMode.system => "",
    };
  }
}
