import 'package:flutter/material.dart';
import 'package:generics_provider/home.dart';
import 'package:generics_provider/models/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {
  AppUser? appUser;
  String? username = "Initial Username";

  updateUsername(String? username) {
    this.username = username;
    notifyListeners();
  }

  updateUser(AppUser? newUser) {
    appUser = newUser;
    notifyListeners();
  }

  //
  // addToCart(Product p,int qty){
  //   p.qty = qty;
  //   products.add(p);
  //   notifyListeners();
  // }
  //
  static of(BuildContext context, {bool listen = true}) =>
      Provider.of<MyAppState>(context, listen: listen);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      builder: (ctx, _) => MaterialApp(home: Home()),
    );
  }
}
