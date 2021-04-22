import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFunctions {
  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
