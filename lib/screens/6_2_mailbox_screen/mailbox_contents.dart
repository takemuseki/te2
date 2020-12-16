import 'package:flutter/material.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_functions.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_parts.dart';

class MailboxContents {
  final MailboxParts parts;
  final MailboxFunctions functions;
  final BuildContext context;
  final Map<String, dynamic> memberUidMap = {};
  MailboxContents({
    @required this.parts,
    @required this.functions,
    @required this.context,
  });

  Widget mailboxStream() {
    print("mailboxStream");
    return StreamBuilder(
      stream: functions.mailboxStream(),
      builder: (context, snapshot) {
        print("stream builder builder");
        if (!snapshot.hasData) {
          return parts.mailboxWaiting();
        } else if (snapshot.hasError) {
          print("error");
          print(snapshot);
          print(snapshot.data);
          return parts.followerListError();
        } else {
          print("else");
          print(snapshot.data);
          return mailboxBuilder(
            mailboxMap: snapshot.data.data(),
          );
        }
      },
    );
  }

  /*
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

   */

  Widget mailboxBuilder({
    @required Map<String, dynamic> mailboxMap,
  }) {
    print("mailboxBuilder");
    if (mailboxMap.length == 0) {
      print("mailboxMap.length == 0");
      return parts.emptyMailbox();
    }
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: mailboxMap.length,
      itemBuilder: (context, i) {
        String key = mailboxMap.keys.elementAt(i);
        print(mailboxMap);
        return parts.mailboxListTile(
          title: mailboxListTileTitle(
            chatRoomId: key,
          ),
          toChatRoom: () {
            functions.toChatRoom(chatRoomId: key);
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

  Widget showBottomSheetButton() {
    print("makeRoomButtonContents");
    //
    return parts.makeRoomButton(
      makeChatRoom: () async {
        memberUidMap.addAll(functions.myUidMap());
        await bottomSheet();
        memberUidMap.clear();
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
                  followersUidMap: map,
                ),
                makeRoom: () async {
                  if (memberUidMap.length == 1) {
                    return null;
                  }
                  bool result =
                      await functions.makeChatRoom(memberMap: memberUidMap);
                  if (result == false) {
                    return parts.failureMakeChatRoomDialog(context: context);
                  }
                  if (result == true) {
                    print(true);
                    print(memberUidMap);
                  }
                  print("functions.backMailbox");
                  return Navigator.pop(context);
                },
              );
            }
          },
        );
      },
    );
  }

  //bottomSheet内に表示されるfollowerのlistView。
  Widget bottomSheetList({
    @required Map<String, dynamic> followersUidMap,
  }) {
    print("bottomSheetList");
    //もしfollowersMapの数が0ならlistViewではなくテキストを返す。
    if (followersUidMap.length == 0) {
      return parts.noFollower();
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: followersUidMap.length,
      itemBuilder: (context, int i) {
        String key = followersUidMap.keys.elementAt(i);
        return followerListTile(
          uid: followersUidMap[key],
        );
      },
    );
  }

  Widget followerListTile({
    @required String uid,
  }) {
    print("followerListTile");
    return FutureBuilder(
      future: functions.getUserInfo(userId: uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return parts.followerListError();
        } else {
          Map<String, dynamic> followerInfoMap = snapshot.data;
          return parts.followerListTile(
            followerListTileTitle: parts.followerListTileTitle(
                followerName: followerInfoMap["user name"]),
            followerListTileLeading: parts.followerListTileLeading(
                imageUrl: followerInfoMap["image"]),
            addUid: () {
              print("addUid contents");
              Map<String, dynamic> map = {uid: followerInfoMap["user name"]};
              memberUidMap.addAll(map);
              print(memberUidMap);
              print("addUid contents end");
            },
            deleteUid: () {
              print("deleteUid contents");
              memberUidMap.remove(uid);
              print(memberUidMap);
              print("deleteUid contents end");
            },
          );
        }
      },
    );
  }
}
