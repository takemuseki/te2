import 'package:flutter/material.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class ChatModel extends ChangeNotifier {
  final FirestoreService firestoreService;
  final String chatRoomId;
  final String uid;
  String lastUpdateTime;
  ChatModel({
    @required this.firestoreService,
    @required this.chatRoomId,
    @required this.uid,
    @required this.lastUpdateTime,
  });

  Future<dynamic> postChat({
  @required TextEditingController textEditingController
}) async {
    try {
      if (textEditingController.text.length == 0) {
        return "null";
      }
      Map<String, dynamic> _map = {
        "timestamp": DateTime.now(),
        "contents": textEditingController.text,
        "account": uid,
      };
      print(_map);
      await firestoreService.fireStoreInstance
          .collection("Chat Rooms")
          .doc(chatRoomId)
          .collection(chatRoomId)
          .add(_map);
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Stream chatStream() {
    print("chatStream");
    return firestoreService.fireStoreInstance
        .collection("Chat Rooms")
        .doc(chatRoomId)
        .collection(chatRoomId)
        .orderBy(
          "timestamp",
          descending: true,
        )
        .limit(20)
        .snapshots();
  }
}
