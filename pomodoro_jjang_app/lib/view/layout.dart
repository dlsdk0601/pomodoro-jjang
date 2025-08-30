import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.child, this.isSafeArea = false});

  final Widget child;
  final bool isSafeArea;

  @override
  Widget build(BuildContext context) {
    if (!isSafeArea) {
      return Scaffold(body: SafeArea(child: child));
    }

    return Scaffold(body: SafeArea(child: child));
  }
}
