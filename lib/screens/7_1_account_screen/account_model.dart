import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class AccountModel extends ChangeNotifier {
  final Map<String, dynamic> infoMap;
  final FirestoreService firestoreService;
  final String uid;
  bool followBoolean;

  AccountModel({
    @required this.infoMap,
    @required this.firestoreService,
    @required this.uid,
    @required this.followBoolean,
  });

  Future<void> changeFollowBoolean({
    @required Map<String, dynamic> map,
  }) async {
    if (map[infoMap["uid"]] != null) {
      followBoolean = true;
      print(followBoolean);
      notifyListeners();
    } else {
      followBoolean = false;
      print(followBoolean);
      notifyListeners();
    }
  }

  Future<dynamic> follow() async {
    try {
      print("follow model");
      print("infoMap");
      print(infoMap);

      print("infoMap[uid]");
      print(infoMap["uid"]);
      print("uid");
      print(uid);
      Map<String, dynamic> map1 = {uid: uid};
      Map<String, dynamic> map2 = {infoMap["uid"]: infoMap["uid"]};
      await firestoreService.updateDocument(
        collectionName: "Followers",
        documentName: infoMap["uid"],
        fieldMap: map1,
      );
      await firestoreService.updateDocument(
        collectionName: "Follows",
        documentName: uid,
        fieldMap: map2,
      );
      print("follow end");
      return true;
    } catch (e) {
      print("e");
      print(e);
      print("follow end");
      return e;
    }
  }

  Future<QuerySnapshot> getCardMap() async {
    print("model getCardMap");
    try {
      final DocumentReference documentReference =
          firestoreService.documentReference2(
        collectionName: "Users",
        documentName: infoMap["uid"],
      );
      final CollectionReference collectionReference =
          documentReference.collection("cards");
      return await collectionReference
          .orderBy("timestamp", descending: true)
          .limit(10)
          .get();
    } catch (e) {
      print("e");
      print(e);
      return e;
    }
  }

  Future<dynamic> unFollow() async {
    try {
      await firestoreService.deleteField(
        collectionName: "Followers",
        documentName: infoMap["uid"],
        fieldName: uid,
      );
      await firestoreService.deleteField(
        collectionName: "Follows",
        documentName: uid,
        fieldName: infoMap["uid"],
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> reloadUserInformation() async {
    try {
      var _userInfo = await firestoreService.getDocument(
        collectionName: "Users",
        documentName: infoMap["uid"],
      );
      var _followInfo = await firestoreService.getDocument(
        collectionName: "Follows",
        documentName: uid,
      );

      return AccountInformation(
        accountMap: _userInfo.data(),
        followMap: _followInfo.data(),
      );
    } catch (e) {
      print(e);
      return e;
    }
  }
}
