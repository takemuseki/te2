import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_model.dart';
import 'package:te2/utils/yet.dart';

class MailboxFunctions {
  final BuildContext context;
  MailboxFunctions({
    @required this.context,
  });

  Future<dynamic> getRoomMembers({
    @required String chatRoomId,
  }) async {
    print("_getRoomMembers");
    return context.watch<MailboxModel>().getRoomMembers(chatRoomId: chatRoomId);
  }

  Future<dynamic> getMailbox() {
    return context.watch<MailboxModel>().getMailbox();
  }

  Future<bool> makeChatRoom() async {
    var _result = await context.read<MailboxModel>().makeChatRoom();
    print(_result);
    if (_result == true) {
      return true;
    } else {
      print(_result);
      return false;
    }
  }

  Future<dynamic> toChatRoom({
    @required String chatRoomId,
  }) async {
    print("toChatRoom");
    var _result = await context.read<MailboxModel>().getChatRoomContents(
          chatRoomId: chatRoomId,
        );
    print(_result);
    print("_result");
    if (_result == "reject") {
      return "reject";
    } else if (_result is ChatRoomInformation) {
      print(_result);
      print("chatROomInformaiton");
      yetDialog(context: context);
      /*
      return Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ChatRoomPageSetup(
              chatRoomInformation: _result,
            );
          },
        ),
      );

       */
    } else {
      return false;
    }
  }

  Map<String, dynamic> otherRoomMembers({
    @required Map<String, dynamic> roomMemberMap,
  }) {
    return context
        .read<MailboxModel>()
        .otherRoomMembers(roomMemberMap: roomMemberMap);
  }

  Future<dynamic> getFollowerMap() async {
    return await context.read<MailboxModel>().showFollowerLists();
  }

  Future<dynamic> getUserInfo({
    @required String userId,
  }) async {
    return await context.read<MailboxModel>().getUserInfo(memberUid: userId);
  }
}
