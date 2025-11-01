import 'package:flutter/material.dart';
import 'package:message/widget/message_typing_box.dart';
import 'package:message/widget/scrolling_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 5, child: ScrollingView()),
          MessageTypingBox(),
        ],
      ),
    );
  }
}
