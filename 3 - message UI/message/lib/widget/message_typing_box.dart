import 'package:flutter/material.dart';

class MessageTypingBox extends StatelessWidget {
  const MessageTypingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(Icons.add, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (text) {},
                    decoration: const InputDecoration(
                      hintText: "Type your acha sa msg here :D",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Right side: Send icon
          IconButton(
            icon: const Icon(Icons.send, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
