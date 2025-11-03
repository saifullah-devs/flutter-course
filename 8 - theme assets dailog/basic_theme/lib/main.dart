import 'package:basic_theme/app_theme.dart';
import 'package:basic_theme/color.dart';
import 'package:basic_theme/utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode currentThemeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightv2,
      darkTheme: AppTheme.dark,
      themeMode: currentThemeMode,
      home: Home(
        onThemeChange: () {
          setState(() {
            if (currentThemeMode == ThemeMode.dark) {
              currentThemeMode = ThemeMode.light;
            } else {
              currentThemeMode = ThemeMode.dark;
            }
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  final Function onThemeChange;

  const Home({Key? key, required this.onThemeChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello world".firstName)),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green),
          ),
          onPressed: () {
            onThemeChange();
          },
          child: Text(
            "Click me!",
            style: context.h1.copyWith(color: AppColors.buttonColor),
          ),
        ),
      ),
    );
  }
}
