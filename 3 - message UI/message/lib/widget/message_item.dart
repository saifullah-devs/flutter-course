import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Fri 08 Jan 2022"),
        Container(
          margin: EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 30),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Text(
            "Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022Fri 08 Jan 2022",
          ),
        ),
      ],
    );
  }
}
