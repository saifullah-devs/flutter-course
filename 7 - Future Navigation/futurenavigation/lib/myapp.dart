import 'package:flutter/material.dart';
import 'package:futurenavigation/about.dart';

pageChangeKro(BuildContext context, Widget page) =>
    Navigator.push<String>(context, MaterialPageRoute(builder: (_) => page));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dataFromAbout = "";

  @override
  void initState() {
    super.initState();
    showMainpage();
  }

  showMainpage() async {
    await Future.delayed(Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    pageChangeKro(context, About());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(dataFromAbout),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed<String>(
                  context,
                  "/about",
                  arguments: {"title": "About ka title home sai"},
                ).then(
                  (value) => setState(() {
                    dataFromAbout = value ?? "";
                  }),
                );
                // var responseFromAbout = await Navigator.push<String>(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => const About(title: "Home s data agya :D"),
                //   ),
                // );
                // print("hello world");
                // setState(() {
                //   dataFromAbout = responseFromAbout ?? "";
                // });
              },
              child: Text("Hello world", style: TextStyle(fontSize: 35)),
            ),
          ],
        ),
      ),
    );
  }
}
