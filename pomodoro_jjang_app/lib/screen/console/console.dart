import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro_jjang_app/router.dart';
import 'package:pomodoro_jjang_app/view/layout.dart';

typedef ConsoleList = List<(String, List<Item>)>;

class ConsoleScreen extends StatelessWidget {
  const ConsoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ConsoleList consoleList = [
      ('디자인', [Item(title: 'Font', location: ConsoleFontRoute().location)]),
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
        context.go(item.location);
      },
    );
  }
}

class Item {
  const Item({required this.title, required this.location});

  final String title;
  final String location;
}
