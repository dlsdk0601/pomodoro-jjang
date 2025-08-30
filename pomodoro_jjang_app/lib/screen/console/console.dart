import 'package:flutter/material.dart';
import 'package:pomodoro_jjang_app/view/layout.dart';

class ConsoleScreen extends StatelessWidget {
  const ConsoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(child: Center(child: Text('console')));
  }
}
