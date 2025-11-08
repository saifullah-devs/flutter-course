import 'package:flutter/material.dart';
import 'package:inherited_widget/models/user.dart';

//  Act as Scopeprovider as provider in other state management solutions
class AppStateWidget extends StatefulWidget {
  final Widget child;
  const AppStateWidget({super.key, required this.child});

  @override
  State<AppStateWidget> createState() => AppStateWidgetState();
}

class AppStateWidgetState extends State<AppStateWidget> {
  User? user;
  // This is where the data (state) lives.
  updateUsername(User newUser) => setState(() {
    user = newUser;
  });

  // any widget below this in the tree can access and modify the state!
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(state: this, child: widget.child);
  }
}

// This widget doesn’t store data itself —
// it just provides access to the AppStateWidgetState from anywhere below it.
class MyInheritedWidget extends InheritedWidget {
  final AppStateWidgetState state;

  const MyInheritedWidget({
    super.key,
    required super.child,
    required this.state,
  });
  // Returns the nearest widget of the given type T and creates a dependency on it,
  // or null if no appropriate widget is found.
  static AppStateWidgetState? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()?.state;

  // “If something inside me changes, rebuild all widgets that depend on me.”
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}


// any child widget can get the app state like this:
//final appState = MyInheritedWidget.of(context);
// final user = appState?.user;
// And to update it:
// appState?.updateUsername(User(name: "Saif"));