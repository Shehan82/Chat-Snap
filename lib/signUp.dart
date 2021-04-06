import 'package:flutter/material.dart';

import 'inputField.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        // title: Image.asset('assets/icon.png'),
        title: Text("Chat Snap"),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputField("User Name"),
          InputField("Email"),
          InputField("Password"),
          SizedBox(
            height: 15,
          ),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.only(right: 15, left: 15),
          //   child: Text(
          //     "Forgot Password",
          //     style: TextStyle(color: Colors.white),
          //     textAlign: TextAlign.right,
          //   ),
          // ),
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
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 18),
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
                "Sign Up with google",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                "Sign In now",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
