import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  TextEditingController controller = new TextEditingController();
  InputField(this.hintText, this.controller);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white, fontSize: 17),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
