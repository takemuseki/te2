import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/common/sevices/firestorage_service.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class MailboxModel {
  final FirestoreService firestoreService;
  final FireStorageService fireStorageService;
  final String uid;

  MailboxModel({
    @required this.firestoreService,
    @required this.fireStorageService,
    @required this.uid,
  });

  Future<dynamic> makeChatRoom({
    @required Map<String, dynamic> memberMap,
  }) async {
    try {
      print("makeChatRoom model");
      Map<String, dynamic> addMap = {"members uid": memberMap};
      //todo　友達を選択する実装を取り入れる。今はいったんtest1ユーザーとのトークルームを作成する。
      String _addResult = await firestoreService.addDocument(
        collectionName: "Chat Rooms",
        map: addMap,
      );
      print(_addResult);
      print("_addResult");
      if (_addResult is Error) {
        return _addResult;
      }
      final Map<String, dynamic> documentIdMap = {
        _addResult: _addResult,
      };
      print(documentIdMap);
      print("documentIdMap");
      //todo ここにチャットルームに追加するcardの情報を入れたい
      Map<String, dynamic> _cardMap = {};
      for (String key in memberMap.keys) {
        await firestoreService.updateDocument(
          collectionName: "Chats",
          documentName: key,
          fieldMap: documentIdMap,
        );
      }
      return true;
    } catch (e) {
      print(e);
      print("model make chat room error");
      return e;
    }
  }

  Stream<DocumentSnapshot> mailboxStream() {
    return firestoreService.fireStoreInstance
        .collection("Chats")
        .doc(uid)
        .snapshots();
  }

  Future<Map<String, dynamic>> getMailbox() async {
    try {
      DocumentSnapshot _result = await firestoreService.getDocument(
        collectionName: "Chats",
        documentName: uid,
      );
      return _result.data();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getRoomMembers({
    @required String chatRoomId,
  }) async {
    print("getRoomMembers");
    try {
      DocumentSnapshot _result = await firestoreService.getDocument(
        collectionName: "Chat Rooms",
        documentName: chatRoomId,
      );
      return _result.data();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getUserInfo({
    @required String memberUid,
  }) async {
    try {
      dynamic _result = await firestoreService.getDocument(
        collectionName: "Users",
        documentName: memberUid,
      );
      return _result.data();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> showFollowerLists() async {
    try {
      return await firestoreService.getDocument(
        collectionName: "Followers",
        documentName: uid,
      );
    } catch (e) {
      print(e);
      return e;
    }
  }
}
