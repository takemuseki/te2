import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/common/sevices/firestore_service.dart';

/*
addFriendUser
deleteFriendRequest
getRequestList
getFriendData
getFriendsList
sendFriendRequests
searchFriendUserId
 */

class ActivityModel {
  final FirestoreService firestoreService;
  final uid;
  final userName;
  ActivityModel({
    @required this.firestoreService,
    @required this.uid,
    @required this.userName,
  });

  //requestを受け入れて自分と相手の友達リストにそれぞれ追加する。
  //requestを削除する。
  //成功したらtrue。失敗したらeを返す。
  Future<dynamic> addFriendUser({
    @required String friendUid,
    @required String friendUserName,
  }) async {
    print("addFriendUser");
    try {
      Map<String, dynamic> map1 = {friendUid: friendUserName};
      Map<String, dynamic> map2 = {uid: userName};
      await firestoreService.updateDocument(
        collectionName: "Friends",
        documentName: uid,
        fieldMap: map1,
      );
      await firestoreService.updateDocument(
        collectionName: "Friends",
        documentName: friendUid,
        fieldMap: map2,
      );
      await firestoreService.deleteField(
        collectionName: "Requests",
        documentName: uid,
        fieldName: friendUid,
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  //友達追加を拒否してrequestから削除する。
  Future<dynamic> deleteFriendRequest({
    @required String friendUid,
  }) async {
    print("deleteFriendRequest");
    try {
      await firestoreService.deleteField(
        collectionName: "Requests",
        documentName: uid,
        fieldName: friendUid,
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getRequestList() async {
    print("getRequestList");
    try {
      DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
        collectionName: "Requests",
        documentName: uid,
      );
      return documentSnapshot.data();
    } catch (e) {
      return e;
    }
  }

  //uidを与えてusersからユーザー情報を引き出す。
  Future<dynamic> getFriendData({
    @required String friendUid,
  }) async {
    print("getFriendData");
    try {
      DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
        collectionName: "Users",
        documentName: friendUid,
      );
      return documentSnapshot.data();
    } catch (e) {
      return e;
    }
  }

  //friendリストを取得する
  Future<dynamic> getFriendsList() async {
    print("getFriendsList");
    try {
      DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
          collectionName: "Friends", documentName: uid);
      return documentSnapshot.data();
    } catch (e) {
      return e;
    }
  }

  //friendのuidからrequestsコレクション内を探索しfriendRequestsとして自分の情報を登録する。
  Future<dynamic> sendFriendRequest({
    @required String friendUid,
  }) async {
    print("sendFriendRequests");
    try {
      Map<String, dynamic> _map = {uid: uid};
      await firestoreService.updateDocument(
        collectionName: "Requests",
        documentName: friendUid,
        fieldMap: _map,
      );
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> searchFriendUserId({
    @required String friendUserId,
  }) async {
    print("searchUserId");
    try {
      dynamic _result = await firestoreService.checkDocumentExistence(
        collectionName: "User Ids",
        documentName: friendUserId,
      );
      if (_result == "null") {
        return "null";
      } else {
        final String _friendUid = _result["uid"];
        DocumentSnapshot _userSnapshot = await firestoreService.getDocument(
          collectionName: "Users",
          documentName: _friendUid,
        );
        print(_userSnapshot);
        return _userSnapshot;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getUserInfo() async {}
}

/*
  //既にrequestを受け取っていれば、"already requested"を返す。
  //存在しないuserIdでの検索であれば、"null"を返す。
  //存在していたら、そのfriendのuserMapを返す。
  Future<dynamic> searchFriendUserId({
    @required String friedUserId,
  }) async {
    print("searchFriendUserId");
    try {
      dynamic _result = await firestoreService.checkDocumentExistence(
        collectionName: "User Ids",
        documentName: friedUserId,
      );
      print(_result);
      if (_result == "null") {
        //存在しないuserIdで検索してしまった。
        return "null";
      } else {
        //userIdでuserの検索に成功した。
        final String _friendUid = _result["uid"];
        DocumentSnapshot _requestSnapshot = await firestoreService.getDocument(
          collectionName: "Requests",
          documentName: uid,
        );
        print(_requestSnapshot);
        print(_requestSnapshot.data());
        print(_requestSnapshot.data()[_friendUid]);
        if (_requestSnapshot.data() == null){
          return
        }
        if (_requestSnapshot.data()[_friendUid] != null) {
          print("requested");
          print(_requestSnapshot.data()[_friendUid]);
          return "already requested";
        } else {
          DocumentSnapshot _friendSnapshot = await firestoreService.getDocument(
            collectionName: "Users",
            documentName: _friendUid,
          );
          DocumentSnapshot _myFriendSnapshot =
              await firestoreService.getDocument(
            collectionName: "Friends",
            documentName: uid,
          );
          if (_myFriendSnapshot[_friendUid] == null) {
            return AccountInformation(
              map: _friendSnapshot.data(),
              friend: false,
            );
          } else {
            return AccountInformation(
              map: _friendSnapshot.data(),
              friend: true,
            );
          }
        }
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

   */
