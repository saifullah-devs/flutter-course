import 'package:flutter/material.dart';
import 'package:inherited_widget/models/user.dart';
import 'package:inherited_widget/state/state.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = MyInheritedWidget.of(context)!.user!.name;
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Card(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.file(
                    MyInheritedWidget.of(context)!.user!.image,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                User newUser = User(
                  name: controller.text,
                  image: MyInheritedWidget.of(context)!.user!.image,
                );
                MyInheritedWidget.of(context)?.updateUsername(newUser);
              },
              child: Text("Update State"),
            ),
          ],
        ),
      ),
    );
  }
}
