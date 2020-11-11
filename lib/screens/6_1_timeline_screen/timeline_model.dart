import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class TimelineModel {
  final FirestoreService firestoreService;
  final String uid;
  TimelineModel({
    @required this.firestoreService,
    @required this.uid,
  });
  List<QueryDocumentSnapshot> timelineSnapshotList;

  Future<dynamic> getTimeline() async {
    try {
      print("getTimeline model");
      print(uid);
      print(uid);
      CollectionReference collectionReference = firestoreService
          .documentReference2(collectionName: "Timeline", documentName: uid)
          .collection(uid);
      print("collectionReference");
      print(collectionReference);
      QuerySnapshot querySnapshot = await collectionReference
          .orderBy("timestamp", descending: true)
          .limit(10)
          .get();
      DocumentReference documentReference = firestoreService.documentReference(
        collectionReference: collectionReference,
        documentName: "CaNUnRWkDx3znCMWw6ax",
      );
      DocumentSnapshot test = await firestoreService.getDocument2(
          documentReference: documentReference);
      print(test);
      print(test.data());
      print("querySnapshot");
      print(querySnapshot);
      print(querySnapshot.docs);
      timelineSnapshotList = querySnapshot.docs;
      print(timelineSnapshotList);

      print("timelineSnapshotList");
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<Map<String, dynamic>> getCard({
    @required String documentId,
  }) async {
    try {
      DocumentSnapshot result = await firestoreService.getDocument(
        collectionName: "Cards",
        documentName: documentId,
      );
      return result.data();
    } catch (e) {
      print(e);
      print("e");
      return e;
    }
  }
}
