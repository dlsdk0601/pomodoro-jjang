import 'package:flutter/material.dart';
import 'package:pomodoro_jjang_app/view/font.dart';
import 'package:pomodoro_jjang_app/view/layout.dart';

class ConsoleFontScreen extends StatelessWidget {
  const ConsoleFontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: ListView(
          children: [
            for (final fontWeight in FontWeight.values)
              _SentenceView(fontWeight: fontWeight),
          ],
        ),
      ),
    );
  }
}

class _SentenceView extends StatelessWidget {
  const _SentenceView({required this.fontWeight});

  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(fontWeight.toString()),
        Text(
          'The quick brown for jumps over the lazy dog',
          style: textStyle(
            fontSize: 18,
            lineHeight: 18,
            fontWeight: fontWeight,
          ),
        ),
        Text(
          '2025년 힐링산업 종사자 전문화를 위한 자격증 취득과정 (지원)',
          style: textStyle(
            fontSize: 18,
            lineHeight: 18,
            fontWeight: fontWeight,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
