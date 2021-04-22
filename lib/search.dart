import 'package:chat_app/services/databaseFunc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchTEC = new TextEditingController();
  DatabaseFunctions dbMethods = new DatabaseFunctions();

  QuerySnapshot snapshot;

  initiateSearch() {
    dbMethods.getUserByUserName(searchTEC.text).then((val) {
      setState(() {
        snapshot = val;
      });
      print(snapshot.size);
    });
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
        title: Text("Chat Snappp"),
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
  SearchTile({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(children: [
            Text(userName, style: TextStyle(color: Colors.white)),
            Text(userEmail, style: TextStyle(color: Colors.white))
          ]),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.indigo[900]),
            child: Text(
              "Message",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
