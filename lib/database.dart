import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Database extends StatefulWidget {
  Database({this.app});
  final FirebaseApp app;
  @override
  _DatabaseState createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  final TextEditingController test = new TextEditingController();
  final refDB = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = refDB.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text("hellooo"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("fuck you firebase!"),
          ),
          Container(
            child: TextField(
              controller: test,
            ),
          ),
          TextButton(
              onPressed: () {
                ref
                    .child("Movies")
                    .push()
                    .child("MovieTitle")
                    .set("blaaa")
                    .asStream();

                print("helloooo");
              },
              child: Text("Press me"))
        ],
      ),
    );
  }
}
