import 'package:flutter/material.dart';
import 'package:futurenavigation/about.dart';
import 'package:futurenavigation/myapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (RouteSettings settings) {
        Map<String, Widget> pages = {"/": Home(), "/about": About()};
        var pageToShow = pages[settings.name] ?? Home();
        if (settings.arguments != null) {
          if (settings.arguments is Map<String, String> &&
              settings.name == "/about") {
            pageToShow = About(
              title: (settings.arguments as Map<String, String>)['title']!,
            );
          }
        }
        return MaterialPageRoute<String>(
          builder: (childContext) => pageToShow,
          settings: settings,
        );
      },
    );
  }
}
