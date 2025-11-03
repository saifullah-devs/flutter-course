import 'package:flutter/material.dart';
import 'generated/assets.asset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.red),
          width: 300,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset(MyImages.trophy1, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
