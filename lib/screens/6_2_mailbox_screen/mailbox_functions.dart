import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_model.dart';
import 'package:te2/utils/yet.dart';

class MailboxFunctions {
  final BuildContext context;
  MailboxFunctions({
    @required this.context,
  });

  Map<String, dynamic> followersUidMap() {
    Map<String, dynamic> map = context.read<MaterialAppModel>().followersUidMap;
    map.remove(context.read<MailboxModel>().uid);
    return map;
  }

  Future<dynamic> getFollowersUidMap() async {
    return await context.read<MaterialAppModel>().newFollowersUidMap();
  }

  Future<dynamic> getMailbox() async {
    print("functions getMailbox");
    return await context.watch<MailboxModel>().getMailbox();
  }

  Stream<DocumentSnapshot> mailboxStream() {
    return context.watch<MailboxModel>().mailboxStream();
  }

  Future<dynamic> getRoomMembers({
    @required String chatRoomId,
  }) async {
    print("getRoomMembers");
    return await context
        .read<MailboxModel>()
        .getRoomMembers(chatRoomId: chatRoomId);
  }

  Future<dynamic> getUserInfo({
    @required String userId,
  }) async {
    return await context.read<MailboxModel>().getUserInfo(memberUid: userId);
  }

  Future<bool> makeChatRoom({
    @required Map<String, dynamic> memberMap,
  }) async {
    var _result =
        await context.read<MailboxModel>().makeChatRoom(memberMap: memberMap);
    print(_result);
    if (_result == true) {
      return true;
    } else {
      print(_result);
      return false;
    }
  }

  Map<String, dynamic> otherRoomMembers({
    @required Map<String, dynamic> roomMap,
  }) {
    print("otherRoomMembers");
    final Map<String, dynamic> roomMemberMap = roomMap["members uid"];
    final _map = Map<String, dynamic>();
    if (roomMemberMap.length == 0) {
      return _map;
    }
    for (String key in roomMemberMap.keys) {
      if (key != context.read<MailboxModel>().uid) {
        Map<String, dynamic> _addMap = {
          key: roomMemberMap[key],
        };
        _map.addAll(_addMap);
      }
    }
    print(_map);
    return _map;
  }

  Future<dynamic> toChatRoom({
    @required String chatRoomId,
  }) async {
    print("toChatRoom functions");
    return Navigator.of(context).pushNamed(
      '/chatPage',
      arguments: ChatRoomInformation(chatRoomId: chatRoomId),
    );
  }

  Map<String, dynamic> myUidMap() {
    Map<String, dynamic> map = {
      context.read<MailboxModel>().uid:
          context.read<MaterialAppModel>().oneselfInfoMap["user name"],
    };
    return map;
  }
}
