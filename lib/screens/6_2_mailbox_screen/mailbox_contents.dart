import 'package:flutter/material.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_functions.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_parts.dart';

class MailboxContents {
  final MailboxParts parts;
  final MailboxFunctions functions;
  final BuildContext context;
  MailboxContents({
    @required this.parts,
    @required this.functions,
    @required this.context,
  });

  Widget mailbox() {
    print("mailbox");
    //
    return FutureBuilder(
      future: functions.getMailbox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return parts.mailboxWaiting();
        } else if (snapshot.hasError) {
          print("has error");
          print(snapshot.error);
          return parts.followerListError();
        } else {
          print("else");
          print(snapshot.data);
          return mailboxBuilder(
            mailboxMap: snapshot.data,
          );
        }
      },
    );
  }

  Widget mailboxBuilder({
    @required Map<String, dynamic> mailboxMap,
  }) {
    print("mailboxBuilder");
    if (mailboxMap.length == 0) {
      print("mailboxMap.length == 0");
      return parts.emptyMailbox();
    }
    return ListView.builder(
      itemCount: mailboxMap.length,
      itemBuilder: (context, i) {
        String key = mailboxMap.keys.elementAt(i);
        print(mailboxMap);
        return parts.mailboxTile(
          title: mailboxListTileTitle(
            chatRoomId: key,
          ),
          toChatRoom: () {
            print("mailboxTile tap");
            /*
            print("toChatRoom");
            functions.toChatRoom(
              chatRoomId: mailboxMap[key],
            );

             */
          },
        );
      },
    );
  }

  Widget mailboxListTileTitle({
    @required String chatRoomId,
  }) {
    print("mailboxListTitle");
    return FutureBuilder(
      future: functions.getRoomMembers(chatRoomId: chatRoomId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("waiting");
          return parts.mailboxWaiting();
        }
        if (snapshot.hasError) {
          print("error");
          print(snapshot);
          print(snapshot.data);
          print(snapshot.error);
          return parts.mailboxListTitleError();
        }
        print("done");
        print(snapshot);
        print(snapshot.data);
        final Map<String, dynamic> otherRoomMembers =
            functions.otherRoomMembers(
          roomMap: snapshot.data,
        );
        return parts.mailboxListTileTitle(
          map: otherRoomMembers,
        );
      },
    );
  }

  Widget makeRoomButton() {
    print("makeRoomButtonContents");
    //
    return parts.makeRoomButton(
      makeChatRoom: () async {
        print("make chat room tap");
        return bottomSheet();
      },
    );
  }

  Future<BottomSheet> bottomSheet() {
    print("bottomSheet");
    //bottomSheetを返す関数。
    //followerList以外の見た目を記述。
    //followerListはbottomSheetList()で呼び出し。
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ModalBottomSheet を押した時のイベントを捕まえるために
        // GestureDetector でラップする
        return FutureBuilder(
          future: functions.getFollowersUidMap(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return parts.getFollowerMapError();
            } else {
              final Map<String, dynamic> map = functions.followersUidMap();
              return parts.bottomSheet(
                bottomSheetList: bottomSheetList(
                  followersMap: map,
                ),
              );
            }
          },
        );
      },
    );
  }

  //bottomSheet内に表示されるfollowerのlistView。
  Widget bottomSheetList({
    @required Map<String, dynamic> followersMap,
  }) {
    print("bottomSheetList");
    //もしfollowersMapの数が0ならlistViewではなくテキストを返す。
    if (followersMap.length == 0) {
      return parts.noFollower();
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: followersMap.length,
      itemBuilder: (context, int i) {
        String key = followersMap.keys.elementAt(i);
        return followerListTile(
          userId: followersMap[key],
        );
      },
    );
  }

  Widget followerListTile({
    @required String userId,
  }) {
    print("followerListTile");
    return FutureBuilder(
      future: functions.getUserInfo(userId: userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return parts.followerListError();
        } else {
          print("FutureBuilder else");
          print(snapshot);
          print(snapshot.data);
          Map<String, dynamic> followerInfoMap = snapshot.data;
          return parts.followerListTile(
            followerListTileTitle: parts.followerListTileTitle(
              followerName: followerInfoMap["user name"],
            ),
            followerListTileLeading: parts.followerListLeading(
              imageUrl: followerInfoMap["image"],
            ),
          );
        }
      },
    );
  }
}
