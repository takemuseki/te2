import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class FirstModel extends ChangeNotifier {
  final FirestoreService firestoreService;
  final String uid;
  FirstModel({
    @required this.firestoreService,
    @required this.uid,
  });

  Map<String, dynamic> userMap;

  Future<void> getUserMap() async {
    try {
      DocumentSnapshot userSnapshot = await firestoreService.getDocument(
        collectionName: "Users",
        documentName: uid,
      );
      userMap = userSnapshot.data();
      print("userMap");
      print(userMap);
      notifyListeners();
    } catch (e) {
      print(e.toString());
      print("通信エラーが起きました");
      return e;
    }
  }

  Future<dynamic> addUserId({
    @required String userId,
  }) async {
    try {
      dynamic result = await firestoreService.checkDocumentExistence(
        collectionName: "User Ids",
        documentName: userId,
      );
      if (result == "null") {
        await firestoreService.makeDocument(
          collectionName: "User Ids",
          documentName: userId,
          map: {"uid": uid},
        );
        Map<String, dynamic> _map = {
          "first": false,
          "user id": userId,
        };
        await firestoreService.updateDocument(
          collectionName: "Users",
          documentName: uid,
          fieldMap: _map,
        );
        return true;
      } else {
        //userIdがすでに存在してしまったということ。
        return false;
      }
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}
