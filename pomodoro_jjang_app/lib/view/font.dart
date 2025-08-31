import 'package:flutter/material.dart';
import 'package:pomodoro_jjang_app/gen/fonts.gen.dart';

TextStyle textStyle({
  required double fontSize,
  required double lineHeight,
  String? fontFamily,
  FontWeight? fontWeight,
  double? letterSpacing,
  Color? color,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  fontFamily ??= FontFamily.suitVariable;
  final fontVariants = <FontVariation>[];

  if (fontFamily == FontFamily.suitVariable) {
    fontVariants.add(
      FontVariation.weight((fontWeight ?? FontWeight.normal).value + 75),
    );

    fontWeight = null;
  }

  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    letterSpacing: letterSpacing,
    height: lineHeight / fontSize,
    color: color,
    decoration: decoration,
    decorationColor: decorationColor,
    fontVariations: fontVariants,
  );
}
