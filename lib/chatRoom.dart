import 'package:chat_app/services/auth.dart';
import 'package:chat_app/search.dart';
import 'package:chat_app/services/databaseFunc.dart';
import 'package:chat_app/services/helper.dart';
import 'package:chat_app/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  DatabaseFunctions dbMethods = new DatabaseFunctions();
  QuerySnapshot snapshot;
  @override
  void initState() {
    dbMethods.getAllChats().then((val) {
      print(val);
      setState(() {
        snapshot = val;
      });
    });
    super.initState();
  }

  Widget chatList() {
    return snapshot != null
        ? Container(
            margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: snapshot.size,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return chatTile(
                    user: snapshot.docs[index].data()["users"][1],
                    chatRoomID: snapshot.docs[index].data()["chatRoomID"],
                  );
                }),
          )
        : Container();
  }

  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Chat Snap"),
        backgroundColor: Colors.indigo[900],
        actions: [
          InkWell(
            onTap: () {
              authMethods.signOut().then((value) => {
                    print(value),
                    helperFunctions.saveUserLoggedInSP(false),
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()))
                  });
            },
            child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.exit_to_app)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[900],
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()))
              .then((value) => {
                    dbMethods.getAllChats().then((val) {
                      print(val);
                      setState(() {
                        snapshot = val;
                      });
                    })
                  });
        },
      ),
      body: Column(
        children: [
          chatList(),
        ],
      ),
    );
  }
}

class chatTile extends StatelessWidget {
  String user;
  String chatRoomID;
  chatTile({this.user, this.chatRoomID});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 20, bottom: 20, right: 12),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.2, color: Colors.grey))),
      child: Text(
        user,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
