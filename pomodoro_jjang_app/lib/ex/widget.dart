import 'package:flutter/material.dart';

TransitionBuilder mergeTransitionBuilder(List<TransitionBuilder> builders) {
  return (BuildContext context, Widget? child) {
    return builders.fold(
      child ?? const SizedBox.shrink(),
      (child, builder) => builder(context, child),
    );
  };
}
