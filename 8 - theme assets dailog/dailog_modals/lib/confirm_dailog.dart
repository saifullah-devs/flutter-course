import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final Function onPress;

  const ConfirmDialog({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: 100,
        color: Colors.red,
        child: ElevatedButton(
          child: Text(title),
          onPressed: () {
            onPress();
          },
        ),
      ),
    );
  }
}
