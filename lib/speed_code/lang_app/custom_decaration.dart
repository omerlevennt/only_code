import 'package:flutter/material.dart';

@immutable
final class CustomDecoration extends BoxDecoration {
  const CustomDecoration()
      : super(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            gradient: const LinearGradient(colors: [
              Colors.green,
              Colors.white,
            ], stops: [
              0.8,
              1.9,
            ]));
}
