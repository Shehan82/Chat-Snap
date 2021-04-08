import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Chat Snap"),
        backgroundColor: Colors.indigo[900],
        actions: [
          Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text(
                "I am the chat Room",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
