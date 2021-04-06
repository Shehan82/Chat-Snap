import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  InputField(this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
