import 'package:chat_app/inputField.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          // title: Image.asset('assets/icon.png'),
          title: Text("Chat Snap"),
        ),
        body: Container(
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              InputField("Email"),
              InputField("Password"),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                height: 50,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.indigo[700],
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                height: 50,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Sign In with google",
                    style: TextStyle(color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
              Container(
                width: double.infinity,
                // padding: EdgeInsets.only(right: 15, left: 15),
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Don't have account? Register now",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
