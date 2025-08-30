import 'package:flutter/material.dart';
import 'package:pomodoro_jjang_app/view/layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          Center(child: Text('home')),
          const _Body(),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: HomeScreenType.values.map((type) {
        return _Item(type: type);
      }).toList(),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.type});

  final HomeScreenType type;

  @override
  Widget build(BuildContext context) {
    String title;

    switch (type) {
      case HomeScreenType.home:
        title = 'Home';
        break;
      case HomeScreenType.settings:
        title = 'Settings';
        break;
      case HomeScreenType.statistics:
        title = 'Statistics';
        break;
    }

    return Center(child: Text(title));
  }
}

enum HomeScreenType { home, settings, statistics }
