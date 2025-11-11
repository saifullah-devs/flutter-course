import 'package:flutter/material.dart';
import 'package:local_data/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: Home());
  }
}
