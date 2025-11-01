import 'package:flutter/material.dart';
import 'package:message/widget/message_item.dart';

class ScrollingView extends StatelessWidget {
  const ScrollingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
          MessageItem(),
        ],
      ),
    );
  }
}
