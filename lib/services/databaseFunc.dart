import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  uploadUserInfo(userMap) {
    print(userMap);
    print("helloooo");
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e);
    });
  }
}
