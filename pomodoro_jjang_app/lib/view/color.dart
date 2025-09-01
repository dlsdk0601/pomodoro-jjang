import 'package:flutter/material.dart';
import 'package:pomodoro_jjang_app/gen/fonts.gen.dart';

const c464646 = Color(0xFF464646);
const c90979D = Color(0xFF90979D);
const cCCCCCC = Color(0xFFCCCCCC);
const cEDEEF0 = Color(0xFFEDEEF0);
const cF6F6F7 = Color(0xFFF6F6F7);
const c013775 = Color(0xFF013775);
const c0082C4 = Color(0xFF0082C4);

const grey_001 = c90979D;
const grey_002 = cCCCCCC;
const grey_003 = cEDEEF0;
const grey_004 = cF6F6F7;

const blue_001 = c013775;
const blue_002 = c0082C4;

final theme = ThemeData(
  brightness: Brightness.light,
  fontFamily: FontFamily.suitStatic,
  appBarTheme: AppBarTheme(backgroundColor: blue_001),
);

final darkTheme = theme.copyWith(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
);
