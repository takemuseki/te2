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

  //Users内自分のdocumentにCardを追加する
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

  //Cardsにcardをaddする。
  //DocumentIdをそれぞれのFollowerに追加する。
  //　todo ここの非同期処理の問題をどう解決するか。
  Future<dynamic> addCardToTimeline({
    @required Map<String, dynamic> map,
    @required Map<String, dynamic> followerMapUid,
  }) async {
    print("addCardToTimeline");
    try {
      String documentId =
          await firestoreService.addDocument(collectionName: "Cards", map: map);
      if (documentId is Error) {
        return documentId;
      }
      final Timestamp timestamp = Timestamp.now();
      Map<String, dynamic> timelineMap = {
        "timestamp": timestamp,
        "document id": documentId
      };
      print(followerMapUid);
      print("followerMapUid");
      followerMapUid.forEach((key, value) async {
        CollectionReference collectionReference = firestoreService
            .documentReference2(
                collectionName: "Timeline", documentName: followerMapUid[key])
            .collection(followerMapUid[key]);

        await firestoreService.addDocument2(
          collectionReference: collectionReference,
          map: timelineMap,
        );
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
