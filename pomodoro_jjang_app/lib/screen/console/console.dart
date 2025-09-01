import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_jjang_app/application.dart';
import 'package:pomodoro_jjang_app/model/app.dart';
import 'package:pomodoro_jjang_app/router.dart';
import 'package:pomodoro_jjang_app/view/block.dart';
import 'package:pomodoro_jjang_app/view/layout.dart';

typedef ConsoleList = List<(String, List<Item>)>;

class ConsoleScreen extends ConsumerWidget {
  const ConsoleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(appProvider);

    final ConsoleList consoleList = [
      (
        '디자인',
        [
          Item(
            title: 'Font',
            onTap: (context) {
              context.go(ConsoleFontRoute().location);
            },
          ),
          Item(
            title: '다크 모드 (현재: ${app.themeMode.label})',
            onTap: (context) {
              ref.read(appProvider.notifier).setThemeMode();
            },
          ),
        ],
      ),
      (
        '동작',
        [
          Item(
            title: '재시작',
            onTap: (context) {
              Application.restart();
            },
          ),
          Item(
            title: '로딩',
            onTap: (context) {
              blockInitialize();
              block(() {
                return Future.delayed(const Duration(seconds: 3));
              });
            },
          ),
        ],
      ),
    ];

    return Layout(
      child: ListView(
        children: [
          for (final (title, items) in consoleList) ...[
            Card(child: ListTile(title: Text(title))),
            for (final item in items) _ItemView(item: item),
          ],
        ],
      ),
    );
  }
}

class _ItemView extends StatelessWidget {
  const _ItemView({required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      onTap: () {
        item.onTap(context);
      },
    );
  }
}

class Item {
  const Item({required this.title, required this.onTap});

  final String title;
  final void Function(BuildContext context) onTap;
}
