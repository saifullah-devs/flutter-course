import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];
  bool isLoading = false;
  final url = 'https://6087dddba6f4a30017425143.mockapi.io/api/todos';

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  getTodos() async {
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.get(Uri.parse(url));
      setState(() {
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          todos = Todo.fromJsonList(jsonData);
        }
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching todos: $e');
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: !isLoading
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (childContext, itemIndex) => ListTile(
                title: Text(todos[itemIndex].title ?? ""),
                subtitle: Text(todos[itemIndex].description ?? ""),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
