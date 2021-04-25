import 'package:chat_app/chatRoom.dart';
import 'package:chat_app/database.dart';
import 'package:chat_app/signIn.dart';
import 'package:chat_app/signUp.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences sp = await SharedPreferences.getInstance();
  bool isLoggedIn = sp.getBool("ISLOGGEDIN");

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  bool isLoggedIn;
  MyApp({this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat Snap',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoggedIn ? ChatRoom() : SignIn());
  }
}
