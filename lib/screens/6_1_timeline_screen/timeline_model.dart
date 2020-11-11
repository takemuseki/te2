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
      CollectionReference collectionReference = firestoreService
          .documentReference2(collectionName: "Timeline", documentName: uid)
          .collection(uid);
      QuerySnapshot querySnapshot = await collectionReference
          .orderBy("timestamp", descending: true)
          .limit(10)
          .get();
      timelineSnapshotList =  querySnapshot.docs;
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }
  
  Future<Map<String,dynamic>> getCard({@required String documentId,}) async{
    try{
      DocumentSnapshot result =  await firestoreService.getDocument(collectionName: "Cards", documentName: documentId,);
      return result.data();
    } catch (e){
      print(e);
      print("e");
      return e;
    }
  }
}
