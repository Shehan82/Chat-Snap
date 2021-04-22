import 'package:chat_app/services/databaseFunc.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchTEC = new TextEditingController();
  DatabaseFunctions dbMethods = new DatabaseFunctions();

  Widget searchList()
  {
    return ListView.builder(
      itemCount: ,
    itemBuilder: (context, index){
      return  
    })
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
                    backgroundColor: Colors.black,
                    onPressed: () {
                      dbMethods.getUserByUserName(searchTEC.text);
                    },
                    child: Icon(Icons.search_rounded),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
