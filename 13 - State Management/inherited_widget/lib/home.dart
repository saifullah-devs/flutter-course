import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inherited_widget/models/user.dart';
import 'package:inherited_widget/profile.dart';
import 'package:inherited_widget/state/state.dart';
import 'dart:io';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController usernameCtrl = TextEditingController();

  pickImage(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    // ignore: use_build_context_synchronously
    var myAppState = MyInheritedWidget.of(context);
    myAppState?.updateUsername(
      User(name: usernameCtrl.text, image: File(pickedImage?.path ?? "")),
    );
  }

  @override
  Widget build(BuildContext context) {
    var myAppState = MyInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("Home page ${myAppState?.user?.name ?? ""}")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(
                hintText: "Please enter your username",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(context);
              },
              child: Text("Update Username"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()),
                );
              },
              child: Text("Goto Profile"),
            ),
            if (myAppState?.user != null)
              Image.file(myAppState!.user!.image, height: 100),
          ],
        ),
      ),
    );
  }
}
