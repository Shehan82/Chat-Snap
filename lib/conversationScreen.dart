import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  Map<String, String> info;

  ConversationScreen({this.info});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  TextEditingController msgTEC = new TextEditingController();

  @protected
  @mustCallSuper
  void initState() {
    print("blaaaaaaaaaaaaaaaaaaaaaa");
    print(widget.info["user"]);
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
                          },
                          child: Icon(Icons.search_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
