import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("ConverstionRoom"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Text(
          "iam conversation room",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
