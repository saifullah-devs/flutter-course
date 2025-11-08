import 'package:flutter/material.dart';
import 'package:nullsafety/model/job_post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<JobPost> listData = [];
  int? editIndex;
  TextEditingController titleFieldController = TextEditingController();
  TextEditingController descpFieldController = TextEditingController();

  //ScrollController _scrollController = ScrollController();
  bool bhtHgyaScrollKia = false;

  @override
  void initState() {
    super.initState();
    /*_scrollController.addListener(() {
      print(_scrollController.offset);
      if (_scrollController.offset > 100) {
        setState(() {
          bhtHgyaScrollKia = true;
        });
      } else {
        setState(() {
          bhtHgyaScrollKia = false;
        });
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Listing ${bhtHgyaScrollKia ? "Bht hgya bhai" : ""}"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Title"),
                      controller: titleFieldController,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Description"),
                      controller: descpFieldController,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (editIndex == null) {
                    setState(() {
                      listData.add(
                        JobPost(
                          titleFieldController.text,
                          descpFieldController.text,
                        ),
                      );
                    });
                  } else {
                    var existingJobPost = listData[editIndex!];
                    existingJobPost.title = titleFieldController.text;
                    existingJobPost.description = descpFieldController.text;
                    setState(() {
                      listData[editIndex!] = existingJobPost;
                      editIndex = null;
                    });
                  }

                  // ignore: avoid_function_literals_in_foreach_calls
                  [titleFieldController, descpFieldController].forEach((
                    element,
                  ) {
                    element.clear();
                  });
                },
                child: Text("${editIndex != null ? "Update" : "Add"} Data"),
              ),
            ],
          ),
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              color: bhtHgyaScrollKia ? Colors.yellow : Colors.white,
              child: ListView.builder(
                // controller: _scrollController,
                itemCount: listData.length,
                itemBuilder: (itemContext, index) {
                  return ListTile(
                    title: Text(
                      listData[index].title,
                      style: TextStyle(fontSize: 35),
                    ),
                    subtitle: Text(
                      listData[index].description,
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              listData.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete, color: Colors.red),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              titleFieldController.text = listData[index].title;
                              descpFieldController.text =
                                  listData[index].description;
                              editIndex = index;
                            });
                          },
                          child: Icon(Icons.edit, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
