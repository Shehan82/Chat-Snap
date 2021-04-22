import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  getUserByUserName(userName) {
    print(userName);
    return FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        .get();
  }

  uploadUserInfo(userMap) {
    print(userMap);
    print("helloooo");
    FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e);
    });
  }

  createChatRoom(docName, userMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(docName)
        .set(userMap)
        .catchError((e) {
      print(e);
    });
  }
}
