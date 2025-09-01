import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro_jjang_app/router.dart';
import 'package:pomodoro_jjang_app/run_main.dart';
import 'package:pomodoro_jjang_app/view/color.dart';

import '../config.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child, this.isSafeArea = true});

  final Widget child;
  final bool isSafeArea;

  @override
  Widget build(BuildContext context) {
    if (!isSafeArea) {
      return Scaffold(
        appBar: AppBarView(context: context, title: 'pomodoro'),
        body: child,
        floatingActionButton: config.runType != RunType.prd
            ? IconButton(
                icon: Icon(Icons.developer_board),
                onPressed: () {
                  context.go(ConsoleRoute().location);
                },
              )
            : null,
      );
    }

    return Scaffold(
      appBar: AppBarView(context: context, title: 'pomodoro'),
      body: SafeArea(child: child),
      floatingActionButton: config.runType != RunType.prd
          ? IconButton(
              icon: Icon(Icons.developer_board),
              onPressed: () {
                context.go(ConsoleRoute().location);
              },
            )
          : null,
    );
  }
}

class AppBarView extends AppBar {
  AppBarView({
    super.key,
    super.centerTitle,
    required BuildContext context,
    required String title,
    super.actions,
  }) : super(
         title: Text(title, style: TextStyle(color: grey_004)),
       );
}
