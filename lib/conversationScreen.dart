import 'package:chat_app/services/databaseFunc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationScreen extends StatefulWidget {
  Map<String, String> info;

  ConversationScreen({this.info});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController msgTEC = new TextEditingController();
  Stream chatMsgStream;

  // @protected
  // @mustCallSuper
  // void initState() {
  //   print("blaaaaaaaaaaaaaaaaaaaaaa");
  //   print(widget.info["user"]);
  // }
  //
  DatabaseFunctions dbMethods = new DatabaseFunctions();
  sendMessage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String user = sp.getString("USERNAME");
    Map<String, String> messageMap = {"message": msgTEC.text, "sendBy": user};
    print(messageMap);
    dbMethods.createMessage(widget.info["chatRoomID"], messageMap);
    print("hellooooooo");
    msgTEC.text = "";
  }

  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMsgStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return MessageTile(
                msg: snapshot.data.docs[index].data()["message"],
              );
            });
      },
    );
  }

  @override
  void initState() {
    dbMethods.getMessages(widget.info["chatRoomID"]).then((val) {
      setState(() {
        chatMsgStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.info["user"]),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Container(
                  decoration: BoxDecoration(color: Colors.indigo[900]),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: TextField(
                            controller: msgTEC,
                            decoration: InputDecoration(
                                hintText: "Message...",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 17),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          onPressed: () {
                            print('object');
                            sendMessage();
                          },
                          child: Icon(Icons.send_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ChatMessageList(),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  String msg;
  MessageTile({this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        msg,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
