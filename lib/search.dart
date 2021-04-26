import 'package:chat_app/conversationScreen.dart';
import 'package:chat_app/services/databaseFunc.dart';
import 'package:chat_app/services/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchTEC = new TextEditingController();
  DatabaseFunctions dbMethods = new DatabaseFunctions();

  QuerySnapshot snapshot;
  String userNameSP;

  initiateSearch() {
    dbMethods.getUserByUserName(searchTEC.text).then((val) {
      setState(() {
        snapshot = val;
      });
      print(snapshot.size);
    });
  }

  createChatRoomAndStartConversation(String userName) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    print(sp.getString("USERNAME"));

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

  Widget searchList() {
    return snapshot != null
        ? ListView.builder(
            itemCount: snapshot.size,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SearchTile(
                userName: snapshot.docs[0].data()["name"],
                userEmail: snapshot.docs[0].data()["email"],
                search: new _SearchState(),
              );
            })
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text("Chat Snap"),
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: searchTEC,
                      decoration: InputDecoration(
                          hintText: "Search here",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 17),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white))),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo[900],
                    onPressed: () {
                      initiateSearch();
                    },
                    child: Icon(Icons.search_rounded),
                  ),
                ),
              ],
            ),
          ),
          searchList(),
        ],
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  final _SearchState search;
  SearchTile({this.userName, this.userEmail, this.search});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              userName,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text(userEmail, style: TextStyle(color: Colors.white, fontSize: 17))
          ]),
          Spacer(),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.indigo[900]),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // print("fuck");
                  search
                      .createChatRoomAndStartConversation(userName)
                      .then((val) => {
                            print(val),
                            if (val != null)
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ConversationScreen(
                                              info: val,
                                            )))
                              }
                          });
                },
                child: Text(
                  "Message",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

getChatRoomID(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
