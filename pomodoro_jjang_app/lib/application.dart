import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_jjang_app/config.dart';
import 'package:pomodoro_jjang_app/ex/widget.dart';
import 'package:pomodoro_jjang_app/model/app.dart';
import 'package:pomodoro_jjang_app/router.dart';
import 'package:pomodoro_jjang_app/view/color.dart';
import 'package:pomodoro_jjang_app/view/splash.dart';

class Application extends HookConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disposed = useRef(false);
    final app = ref.watch(appProvider);
    final router = useMemoized(
      () => buildRouter(routerInitialLocation: config.routerInitialLocation),
    );

    useEffect(() {
      Future(() async {
        if (disposed.value) {
          return;
        }

        if (!context.mounted) {
          return;
        }

        ref.read(appProvider.notifier).setInitialized();
      });
      return () {
        disposed.value = true;
      };
    }, []);

    return MaterialApp.router(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: app.themeMode,
      routerConfig: router,
      builder: mergeTransitionBuilder([
        SplashFadeCoverView.init(
          splash: const SplashView(),
          hideSplash: app.initialized,
          duration: config.splashFadeDuration,
        ),
        EasyLoading.init(),
      ]),
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

  static void restart() async {
    await Future.delayed(kThemeAnimationDuration);

    _runWithKey(providerKey: UniqueKey(), applicationKey: UniqueKey());
  }
}
