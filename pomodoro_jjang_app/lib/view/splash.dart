import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../ex/image.dart';
import '../gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static late final ui.Image _image;

  @override
  Widget build(BuildContext context) {
    return RawImage(image: _image, fit: BoxFit.cover);
  }

  static Future<void> initialize() async {
    _image = await imageFromAsset(Assets.splash.path);
  }
}

class SplashFadeCoverView extends StatelessWidget {
  const SplashFadeCoverView({
    super.key,
    required this.splash,
    required this.hideSplash,
    Duration? duration,
    this.child,
  }) : duration = duration ?? const Duration(milliseconds: 1000);

  final Widget splash;
  final bool hideSplash;
  final Duration duration;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedCrossFade(
          firstChild: SizedBox.fromSize(
            size: constraints.biggest,
            child: splash,
          ),
          secondChild: SizedBox.fromSize(
            size: constraints.biggest,
            child: child ?? const SizedBox(),
          ),
          crossFadeState: hideSplash
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: duration,
        );
      },
    );
  }

  static TransitionBuilder init({
    required Widget splash,
    required bool hideSplash,
    Duration? duration,
  }) {
    return (BuildContext context, Widget? child) {
      return SplashFadeCoverView(
        splash: splash,
        hideSplash: hideSplash,
        duration: duration,
        child: child,
      );
    };
  }
}
