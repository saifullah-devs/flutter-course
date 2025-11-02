import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final String? existingTitle;
  final String? existingDescp;
  final bool isEdit;
  const FormScreen({
    super.key,
    this.existingTitle,
    this.existingDescp,
    this.isEdit = false,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descpFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If editing, pre-fill fields
    if (widget.isEdit) {
      titleFieldController.text = widget.existingTitle ?? '';
      descpFieldController.text = widget.existingDescp ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Now Note'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: titleFieldController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descpFieldController,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                alignLabelWithHint: true,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  onSave(context);
                },
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.blue[700],
                  // foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  widget.isEdit ? 'Update Note' : 'Submit Note',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSave(BuildContext context) {
    if (titleFieldController.text.isEmpty ||
        descpFieldController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    var data = FormData(titleFieldController.text, descpFieldController.text);
    Navigator.pop(context, data);
  }
}

class FormData {
  final String title;
  final String descp;

  FormData(this.title, this.descp);
}
