import 'dart:convert';
import 'package:future_builder/github_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<GithubUser> getData() async {
    var response = await http.get(
      Uri.parse("https://api.github.com/users/ishaquehassan"),
    );
    return GithubUser.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Builder")),
      body: FutureBuilder<GithubUser>(
        future: getData(),
        builder: (childContent, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Text("Bhai msla hgya h :D");
          } else {
            return Image.network(snapshot.data?.avatarUrl ?? "");
          }
        },
      ),
    );
  }
}
