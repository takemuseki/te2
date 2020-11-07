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

  Future<dynamic> makeChatRoom() async {
    try {
      print("makeChatRoom");
      //todo　友達を選択する実装を取り入れる。今はいったんtest1ユーザーとのトークルームを作成する。
      final Map<String, dynamic> _map = {
        "members": {
          "ZQGmWGBPlmVZOimJLoorrczWFHB2": "test1",
          "zhszSIVEwBZhNU2XOvOc0WRbxcR2": "test3",
        },
      };
      print(_map);
      print("addResult");
      String _addResult = await firestoreService.addDocument(
        collectionName: "Chat Room Members",
        map: _map,
      );
      print(_addResult);
      final Map<String, dynamic> _map2 = {
        "ZQGmWGBPlmVZOimJLoorrczWFHB2": _addResult,
      };
      print(_map2);
      print("map2");
      final Map<String, dynamic> _map3 = {
        "zhszSIVEwBZhNU2XOvOc0WRbxcR2": _addResult,
      };
      print(_map3);
      print("_map3");
      //todo ここにチャットルームに追加するcardの情報を入れたい
      Map<String, dynamic> _cardMap = {};
      await firestoreService.makeDocument(
        collectionName: "Chat Rooms",
        documentName: _addResult,
        map: _map,
      );
      print(1);
      await firestoreService.updateDocument(
        collectionName: "Chats",
        documentName: uid,
        fieldMap: _map2,
      );
      print(2);
      await firestoreService.updateDocument(
        collectionName: "Chats",
        documentName: "ZQGmWGBPlmVZOimJLoorrczWFHB2",
        fieldMap: _map3,
      );
      print(3);
      return true;
    } catch (e) {
      print(e);
      print("model make chat room error");
      return e;
    }
  }

  Future<dynamic> getChatRoomContents({
    @required String chatRoomId,
  }) async {
    print("getChatRoomContents");
    print(chatRoomId);
    try {
      DocumentSnapshot _chatRoomDocument = await firestoreService.getDocument(
        collectionName: "Chat Rooms",
        documentName: chatRoomId,
      );
      Map<String, dynamic> _chatRoomMap = _chatRoomDocument.data();
      Map<String, dynamic> _membersMap = _chatRoomMap.remove("members");
      if (_membersMap[uid] == null) {
        print("reject");
        return "reject";
      } else {
        final ChatRoomInformation _chatRoomInformation = ChatRoomInformation(
          memberMap: _membersMap,
          contentMap: _chatRoomMap,
          chatRoomId: chatRoomId,
        );
        return _chatRoomInformation;
      }
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> getMailbox() async {
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
    print("getChatRoomMembers");
    try {
      DocumentSnapshot _result = await firestoreService.getDocument(
        collectionName: "Chat Room Members",
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
      return "get user info error";
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
      return "error";
    }
  }

  Map<String, dynamic> otherRoomMembers({
    @required Map<String, dynamic> roomMemberMap,
  }) {
    print("otherRoomMembers");
    final _map = Map<String, dynamic>();
    if (_map == null) {
      return _map;
    }
    for (String key in roomMemberMap.keys) {
      if (key != uid) {
        Map<String, dynamic> _addMap = {
          key: roomMemberMap[key],
        };
        _map.addAll(_addMap);
      }
    }
    print("syuuryou");
    print(_map);
    return _map;
  }
}
