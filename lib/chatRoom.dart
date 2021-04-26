import 'package:chat_app/conversationScreen.dart';
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

  refreshPage() {
    print("this is refresh page fucker");
    dbMethods.getAllChats().then((val) {
      print(val);
      setState(() {
        snapshot = val;
      });
    });
  }

  Widget chatList() {
    return snapshot != null
        ? Container(
            child: ListView.builder(
                itemCount: snapshot.size,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return chatTile(
                    user: snapshot.docs[index].data()["users"][1],
                    chatRoomID: snapshot.docs[index].data()["chatRoomID"],
                    func: refreshPage,
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
  Function func;

  chatTile({this.user, this.chatRoomID, this.func});

  DatabaseFunctions dbMethods = new DatabaseFunctions();

  createChatRoomAndStartConversation(String userName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String> users = [
      sp.getString("USERNAME"),
      userName
    ]; //[logged person userName, searched person userName]

    String chatRoomID = getChatRoomID(userName, sp.getString("USERNAME"));
    Map<String, dynamic> chatRoomInfo = {
      "timeStamp": DateTime.now().millisecondsSinceEpoch,
      "chatRoomID": chatRoomID,
      "users": users
    };

    Map<String, String> info = {"chatRoomID": chatRoomID, "user": userName};

    if (userName != sp.getString("USERNAME")) {
      dbMethods.createChatRoom(chatRoomID, chatRoomInfo);
      return info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.indigo[900],
      onTap: () {
        createChatRoomAndStartConversation(user).then((val) => {
              print(val),
              if (val != null)
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConversationScreen(
                                info: val,
                              ))).then((value) => {
                        dbMethods.getAllChats().then((val) {
                          func();
                        })
                      })
                }
            });
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 20, bottom: 20, right: 12),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(255, 255, 255, 0.3)))),
        child: Row(
          children: [
            Container(
              child: Text(
                user,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
