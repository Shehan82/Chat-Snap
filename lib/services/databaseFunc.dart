import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  getUserByUserName(userName) {
    FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        .get()
        .then((value) => print(value));

    // print(x);
  }

  uploadUserInfo(userMap) {
    print(userMap);
    print("helloooo");
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e);
    });
  }
}
