import 'package:dailog_modals/confirm_dailog.dart';
import 'package:dailog_modals/my_bottom_sheet.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) => ConfirmDialog(
                    title: "Are you sure?",
                    onPress: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              child: Text("Click to open Dialog"),
            ),
            SizedBox(height: 30),
            Builder(
              builder: (childContext) => ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: childContext,
                    builder: (bottomSheetContext) => MyBottomSheet(),
                  );
                },
                child: Text("Bottom Sheet"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
