import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro_jjang_app/config.dart';
import 'package:pomodoro_jjang_app/screen/console/console.dart';
import 'package:pomodoro_jjang_app/screen/console/font.dart';
import 'package:pomodoro_jjang_app/screen/home/home.dart';

part 'router.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ConsoleRoute>(
      path: 'console',
      routes: [TypedGoRoute<ConsoleFontRoute>(path: 'font')],
    ),
  ],
)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class ConsoleRoute extends GoRouteData with _$ConsoleRoute {
  const ConsoleRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConsoleScreen();
}

class ConsoleFontRoute extends GoRouteData with _$ConsoleFontRoute {
  const ConsoleFontRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ConsoleFontScreen();
}

GoRouter buildRouter({String? routerInitialLocation}) {
  return GoRouter(
    routes: $appRoutes,
    initialLocation: routerInitialLocation == config.routerInitialLocation
        ? null
        : routerInitialLocation,
  );
}
