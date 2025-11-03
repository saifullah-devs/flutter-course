import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String username = "";
  String? name;
  String? bio;
  int? id;
  String? avatarUrl;
  bool isLoading = false;

  callApi(String username) async {
    String url = "https://api.github.com/users/$username";
    setState(() {
      isLoading = true;
    });
    try {
      var response = await http.get(Uri.parse(url));
      var responseString = response.body;
      Map<String, dynamic> parsedJson = jsonDecode(responseString);
      setState(() {
        name = parsedJson['name'];
        id = parsedJson['id'];
        bio = parsedJson['bio'];
        avatarUrl = parsedJson['avatar_url'];
      });
    } catch (e) {
      // print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Github User API')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter GitHub username',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => callApi(controller.text),
                child: const Text('Fetch'),
              ),
            ],
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (avatarUrl != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(avatarUrl!),
                    ),
                  const SizedBox(height: 16),
                  if (name != null)
                    Text('Name: $name', style: const TextStyle(fontSize: 20)),
                  if (id != null)
                    Text('ID: $id', style: const TextStyle(fontSize: 16)),
                  if (bio != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Bio: $bio',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
