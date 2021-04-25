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
  String ust;
  sendMessage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // setState(() {
    //   ust = sp.getString("USERNAME");
    // });
    if (msgTEC.text != "") {
      String user = sp.getString("USERNAME");
      Map<String, dynamic> messageMap = {
        "message": msgTEC.text,
        "sendBy": user,
        "timeStamp": DateTime.now().microsecondsSinceEpoch
      };
      print(messageMap);
      dbMethods.createMessage(widget.info["chatRoomID"], messageMap);
      print("hellooooooo");
      msgTEC.text = "";
    }
  }

  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMsgStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Container(
                margin: EdgeInsets.only(bottom: 100),
                child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MessageTile(
                        msg: snapshot.data.docs[index].data()["message"],
                        isSendByMe:
                            snapshot.data.docs[index].data()["sendBy"] == ust,
                      );
                    }),
              )
            : Container();
      },
    );
  }

  setUst() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      ust = sp.getString("USERNAME");
    });
  }

  @override
  void initState() {
    setUst();
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
            ChatMessageList(),
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
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  String msg;
  bool isSendByMe;
  MessageTile({this.msg, this.isSendByMe});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: isSendByMe ? Colors.indigo[900] : Colors.grey[850],
            borderRadius: isSendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
                : BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
        child: Text(
          msg,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
