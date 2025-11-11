import 'package:flutter/material.dart';
import 'package:generics_provider/main.dart';
import 'package:generics_provider/models/user_model.dart';
import 'package:generics_provider/models/response_model.dart';
import 'dart:convert';

// class ServiceCenter<C>{
//   C car;
//   ServiceCenter(this.car);
//
//   C getVehicle() => car;
// }

class Home extends StatelessWidget {
  const Home({super.key});

  AppUser? parseData() {
    String json = '''
    {
    "message": "Success",
    "statusCode": 200,
    "data": {
        "id": 1,
        "email": "Saifullah.dev@gmail.com",
        "phone": "123",
        "password": "123456",
        "accessToken": "c4ddb485-5dad-4b23-982e-b3926849776e"
    }
}
    ''';
    var decodedJSON = jsonDecode(json);
    AppUser u = AppUser.fromJson(decodedJSON['data']);

    var res1 = ApiResponse<AppUser>.fromJson(decodedJSON, u);
    return res1.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider & Generics")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              MyAppState.of(context).appUser?.email ?? "",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                // MyAppState.of(
                //   context,
                //   listen: false,
                // ).updateUsername("Hello world");
                MyAppState.of(context, listen: false).updateUser(parseData());
              },
              child: Text("Update App State"),
            ),
          ],
        ),
      ),
    );
  }
}
