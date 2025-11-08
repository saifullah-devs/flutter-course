import 'package:flutter/material.dart';

extension MyUIExt on BuildContext {
  TextStyle get h1 => Theme.of(this).textTheme.displayLarge!;
}

extension MyStrExt on String {
  String get firstName => split(" ").first;
  String get lastName => split(" ").last;
}
