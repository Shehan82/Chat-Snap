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

  getAllChats(loggedInPerson) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        // .where("users.kalana", isEqualTo: true)
        .orderBy("timeStamp", descending: true)
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
    print(chatRoomID);
    print(messageMap);
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e);
    });
  }

  getMessages(chatRoomID) async {
    print(chatRoomID);
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomID)
        .collection("chats")
        .orderBy("timeStamp", descending: false)
        .snapshots();
  }
}
