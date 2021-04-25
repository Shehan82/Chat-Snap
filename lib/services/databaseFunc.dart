import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  getUserByUserName(userName) {
    print(userName);
    return FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: userName)
        .get();
  }

  getUserByUserEmail(userEmail) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: userEmail)
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

  createMessage(chatRoomID, messageMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e);
    });
  }
}
