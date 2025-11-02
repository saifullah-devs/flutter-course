import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String title;

  const About({Key? key, this.title = "About"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop<String>(context, "Han bhai hgya :D");
          },
          child: Text("About Hello world", style: TextStyle(fontSize: 35)),
        ),
      ),
    );
  }
}
