import 'package:flutter/material.dart';
import 'package:inherited_widget/home.dart';
import 'package:inherited_widget/state/state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppStateWidget(child: MaterialApp(home: Home()));
  }
}
