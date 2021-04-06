import 'package:chat_app/inputField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          // title: Image.asset('assets/icon.png'),
          title: Text("Chat Snap"),
        ),
        body: Column(
          children: [InputField("Email"), InputField("Password")],
        ),
      ),
    );
  }
}
