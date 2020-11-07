import 'package:flutter/material.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_functions.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_parts.dart';
import 'package:te2/utils/dialog.dart';

class MailboxContents {
  final MailboxParts parts;
  final MailboxFunctions functions;
  MailboxContents({
    @required this.parts,
    @required this.functions,
  });

  Widget futureListTileTitle({
    @required String chatRoomId,
  }) {
    print("futureListTileTitle");
    //
    //
    //
    return FutureBuilder(
      future: functions.getRoomMembers(chatRoomId: chatRoomId),
      builder: (context, snapshot) {
        print("futureListTileTitle");
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("waiting");
          return parts.chatListWaiting();
        }
        if (snapshot.hasError) {
          print("error");
          return parts.chatListTileTitleError();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print("done");
          print(snapshot);
          print(snapshot.data);
          final Map<String, dynamic> _otherRoomMembers =
              functions.otherRoomMembers(
            roomMemberMap: snapshot.data["members"],
          );
          print(_otherRoomMembers);
          print("_otherRoomMembers");
          return parts.chatListTileTitle(
            map: _otherRoomMembers,
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget chatRoomListView({
    @required Map<String, dynamic> chatRoomMap,
  }) {
    print("futureChatRoomListView");
    //
    //
    return ListView.builder(
      itemCount: chatRoomMap.length,
      itemBuilder: (context, i) {
        print(chatRoomMap);
        print("chatRoomMap");
        String key = chatRoomMap.keys.elementAt(i);
        print(key);
        print("key");
        print(chatRoomMap[key]);
        print("value");
        return parts.chatListTile(
          title: futureListTileTitle(
            chatRoomId: chatRoomMap[key],
          ),
          toChatRoom: () {
            print("toChatRoom");
            functions.toChatRoom(
              chatRoomId: chatRoomMap[key],
            );
          },
        );
      },
    );
  }

  Widget futureChatRoomListView() {
    print("futureChatRoomListView");
    //
    return FutureBuilder(
      future: functions.getMailbox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("viewContents waiting");
          return parts.chatListWaiting();
        } else if (snapshot.hasError) {
          print("viewContents error");
          return parts.chatListError();
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("viewContents done");
          return chatRoomListView(
            chatRoomMap: snapshot.data,
          );
        } else {
          print("viewContents else");
          return parts.chatListError();
        }
      },
    );
  }

  Widget makeRoomButtonContents() {
    //
    return parts.makeRoomButton(
      makeChatRoom: () async {
        await makeRoomView();
      },
    );
  }

  Future<dynamic> makeRoomView() async {
    dynamic _result = await functions.getFollowerMap();
    if (_result == "error") {
      return parts.failureDialog();
    } else {
      print(_result.data());
      final Map<String, dynamic> followerMap = _result.data();
      final map = {
        "1": "1",
        "2": "2",
      };
      final Map<String, dynamic> userInfoMap = Map<String, dynamic>();
      print(followerMap);
      print("followerMap");
      for (String key in followerMap.keys) {
        dynamic map2 = await functions.getUserInfo(userId: followerMap[key]);
        if (map2 == "get user info error") {
          continue;
        }
        Map<String, dynamic> map3 = {key: map2};
        userInfoMap.addAll(map3);
        print(userInfoMap);
        print(1);
      }
      print(userInfoMap);
      print(2);

      return parts.bottomSheet(followerMap: followerMap, userInfoMap: userInfoMap);
    }
  }
}
