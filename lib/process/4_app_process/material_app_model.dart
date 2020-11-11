import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class MaterialAppModel extends ChangeNotifier {
  final FirestoreService firestoreService;
  final String uid;
  final Map<String, dynamic> oneselfInfoMap;
  MaterialAppModel({
    @required this.firestoreService,
    @required this.uid,
    @required this.oneselfInfoMap,
  });
  Map<String, dynamic> followersUidMap;
  Map<String, dynamic> followsUidMap;
  Map<String, dynamic> oneselfCardsMap;

  Future<void> updateOneselfInfoMap(
      {@required Map<String, dynamic> map}) async {
    try {
      print("updateOneselfInfoMap");
      await firestoreService.updateDocument(
        collectionName: "Users",
        documentName: uid,
        fieldMap: map,
      );
      print("updateOneselfInfoMap2");
      DocumentSnapshot updateMap = await firestoreService.getDocument(
          collectionName: "Users", documentName: uid);
      print("updateOneselfInfoMap3");
      print(updateMap);
      print(oneselfInfoMap);
      oneselfInfoMap.addAll(updateMap.data());
      print(oneselfInfoMap);
      notifyListeners();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<void> updateOneselfCardMap(
      {@required Map<String, dynamic> map}) async {
    try {
      print("updateOneselfInfoMap");
      await firestoreService.updateDocument(
        collectionName: "Users",
        documentName: uid,
        fieldMap: map,
      );
      print("updateOneselfInfoMap2");
      DocumentSnapshot updateMap = await firestoreService.getDocument(
          collectionName: "Users", documentName: uid);
      print("updateOneselfInfoMap3");
      print(updateMap);
      print(oneselfInfoMap);
      oneselfInfoMap.addAll(updateMap.data());
      print(oneselfInfoMap);
      notifyListeners();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<Map<String, dynamic>> newFollowersUidMap() async {
    try {
      print("newFollowersUidMap");

      DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
          collectionName: "Followers", documentName: uid);
      Map<String, dynamic> map = documentSnapshot.data();
      followersUidMap = map;
      print("newFollowersUidMap end");

      return followersUidMap;
    } catch (e) {
      print(e);
      print("newFollowersUidMap end");

      return e;
    }
  }

  Future<Map<String, dynamic>> newFollowsUidMap() async {
    print("newFollowsUidMap");
    DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
        collectionName: "Follows", documentName: uid);
    Map<String, dynamic> map = documentSnapshot.data();
    followsUidMap = map;
    print(followsUidMap);
    print("newFollowsUidMap end");
    return followsUidMap;
  }
}
