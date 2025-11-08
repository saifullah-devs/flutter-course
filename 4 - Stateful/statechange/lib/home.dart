import 'package:flutter/material.dart';

/*
*  const meraText = Text('Hello Text 1');
    const meraText2 = Text('Hello Text 2');
    List<Widget> allWidgets = [
      meraText,
      meraText2
    ];

    for(var widget in allWidgets){
      if(widget is StatelessWidget){
        (widget as StatelessWidget).build(context);
      }else if(widget is StatefulWidget){

      }
    }
* */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  String message1 = 'Hello world 1';
  String message2 = 'Hello world 2';
  bool ismsgChange = false;
  bool isColorRed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isColorRed ? Colors.black : Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ismsgChange ? message2 : message1,
              style: TextStyle(
                fontSize: 65,
                color: isColorRed ? Colors.white : Colors.black,
              ),
            ),
            ElevatedButton(
              onPressed: updateName,
              child: const Text('Update Ttext'),
            ),
          ],
        ),
      ),
    );
  }

  updateName() {
    setState(updateState);
  }

  updateState() {
    ismsgChange = !ismsgChange;
    isColorRed = !isColorRed;
  }
}
