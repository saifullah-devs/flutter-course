import 'package:flutter/material.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<FormData> items = [];
  List<bool> keywordSelections = List.generate(400, (index) => false);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: items.isNotEmpty
            ? ListView.builder(
                itemCount: items.length,
                itemBuilder: itemBuilder,
              )
            : const Center(
                child: Text(
                  'No Notes available!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push<FormData>(
                  MaterialPageRoute(builder: (_) => const FormScreen()),
                )
                .then(
                  (value) => setState(() {
                    if (value != null) {
                      items.add(value);
                    }
                  }),
                );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) => Card(
    margin: const EdgeInsets.all(10),
    elevation: 2,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  items[index].descp,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              // Edit functionality
              _editItem(context, index);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                items.removeAt(index);
              });
            },
          ),
        ],
      ),
    ),
  );

  void _editItem(BuildContext context, int index) {
    Navigator.of(context)
        .push<FormData>(
          MaterialPageRoute(
            builder: (_) => FormScreen(
              isEdit: true,
              existingTitle: items[index].title,
              existingDescp: items[index].descp,
            ),
          ),
        )
        .then(
          (value) => setState(() {
            if (value != null) {
              items[index] = value;
            }
          }),
        );
  }
}
