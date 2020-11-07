import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class PostModel {
  final FirestoreService firestoreService;
  final String uid;
  PostModel({
    @required this.firestoreService,
    @required this.uid,
  });

  Future<dynamic> addCardToUsers({
    @required Map<String, dynamic> map,
  }) async {
    print("addCardToUsers");

    try {
      CollectionReference collectionReference = firestoreService
          .documentReference2(collectionName: "Users", documentName: uid)
          .collection("cards");
      await firestoreService.addDocument2(
          collectionReference: collectionReference, map: map);
      print("addCardToUsers end");

      return true;
    } catch (e) {
      return e;
    }
  }

  //　todo ここの非同期処理の問題をどう解決するか。
  Future<dynamic> addCardToTimeline({
    @required Map<String, dynamic> map,
    @required Map<String, dynamic> followerMapUid,
  }) async {
    print("addCardToTimeline");
    try {
      followerMapUid.forEach((key, value) async {
        CollectionReference collectionReference = firestoreService
            .documentReference2(
                collectionName: "Timeline", documentName: followerMapUid[key])
            .collection(followerMapUid[key]);
        await firestoreService.addDocument2(
            collectionReference: collectionReference, map: map);
        print("for each end");
      });
      print("addCardToTimeline end");

      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
