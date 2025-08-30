import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

Future<Image> imageFromAsset(String assetName) async {
  final completer = Completer<Image>();
  decodeImageFromList(
    Uint8List.sublistView(await rootBundle.load(assetName)),
    completer.complete,
  );

  return completer.future;
}
