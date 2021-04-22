import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  getUserByUserName(userName) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        .get()
        .then((value) => print(value.docs[0].data()["name"]));

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
