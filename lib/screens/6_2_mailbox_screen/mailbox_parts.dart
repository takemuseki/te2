import 'dart:ffi';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';
import 'package:te2/utils/yet.dart';

class MailboxParts {
  final BuildContext context;
  MailboxParts({@required this.context});

  Widget bottomSheet({
    @required dynamic bottomSheetList,
    @required VoidCallback makeRoom,
  }) {
    return GestureDetector(
      onTap: () {
        print("tap modal bottom sheet gesture detector");
        // ModalBottomSheet を押した時には何もしないようにする
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        // ModalBottomSheet のどこを押してもラップした GestureDetector が
        // 検知できるように、ラップした Container には色をつけておく
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Text("トークルームに追加するメンバーを選択")),
                Center(
                  child: RaisedButton(
                    child: Text("作成"),
                    onPressed: makeRoom,
                  ),
                ),
              ],
            ),
            Expanded(
              child: bottomSheetList,
            ),
          ],
        ),
      ),
    );
  }

  Widget emptyMailbox() {
    return Text("mailboxが空です");
  }

  Widget followerListError() {
    return Text("エラー");
  }

  Widget followerListTile({
    @required Widget followerListTileTitle,
    @required Widget followerListTileLeading,
    @required VoidCallback addUid,
    @required VoidCallback deleteUid,
  }) {
    return FollowerListTile(
      followerListTileLeading: followerListTileLeading,
      followerListTileTitle: followerListTileTitle,
      addUid: addUid,
      deleteUid: deleteUid,
    );
  }

  /*
  Widget followerListTile({
    @required Widget followerListTileTitle,
    @required Widget followerListTileLeading,
    @required VoidCallback addMember,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: addMember,
          child: ListTile(
            leading: followerListTileLeading,
            title: followerListTileTitle,
          ),
        ),
        elevation: 5,
      ),
    );
  }

   */

  Widget followerListTileLeading({
    @required String imageUrl,
  }) {
    print("userImage");
    print(imageUrl);
    print("imageUrl");
    String initialText;
    if (imageUrl == "") {
      initialText = "No Image";
    } else {
      initialText = "Loading";
    }
    print(initialText);
    print("initialText");
    return CircularProfileAvatar(
      imageUrl,
      radius: 60,
      initialsText: Text(
        initialText,
        style: TextStyle(fontSize: 20),
      ),
      borderColor: Theme.of(context).accentColor,
      cacheImage: true,
    );
  }

  Widget followerListTileTitle({
    @required String followerName,
  }) {
    return Text(followerName);
  }

  Widget getFollowerMapError() {
    return Text("followerの取得に失敗しました");
  }

  Widget mailboxListTile({
    @required Widget title,
    @required VoidCallback toChatRoom,
  }) {
    return Card(
      child: InkWell(
        onTap: toChatRoom,
        child: ListTile(
          title: title,
        ),
      ),
    );
  }

  Widget mailboxListTitleError() {
    return Text("エラー");
  }

  Widget mailboxListTileTitle({
    @required Map<String, dynamic> map,
  }) {
    print("mailboxListTileTitle parts");
    String title = "";
    if (map.length != 0) {
      for (String key in map.keys) {
        title = title + " " + map[key];
      }
    }
    return Text(title);
  }

  Widget mailboxWaiting() {
    return CircularProgressIndicator();
  }

  Widget makeRoomButton({
    @required VoidCallback makeChatRoom,
  }) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: makeChatRoom,
    );
  }

  Widget noFollower() {
    return Text("followerがいません");
  }

  Future<Dialog> failureDialog() {
    return errorDialog(context: context);
  }

  Future<Dialog> successDialog() {
    return simpleDialog(
      titleWidget: Text("seikou"),
      contentWidget: Text("seikou"),
      context: context,
    );
  }

  Future<Dialog> failureMakeChatRoomDialog({
    @required BuildContext context,
  }) {
    final Widget title = Text("エラー");
    final Widget content = Text("チャットルームの作成に失敗しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }
}

class FollowerListTile extends StatefulWidget {
  final Widget followerListTileLeading;
  final Widget followerListTileTitle;
  final VoidCallback addUid;
  final VoidCallback deleteUid;

  const FollowerListTile({
    @required this.followerListTileLeading,
    @required this.followerListTileTitle,
    @required this.addUid,
    @required this.deleteUid,
  });
  @override
  _FollowerListTileState createState() => _FollowerListTileState();
}

class _FollowerListTileState extends State<FollowerListTile> {
  List<Color> color = [
    Colors.white,
    Colors.amberAccent,
  ];
  int counter = 0;
  void addCounter() {
    setState(() {
      counter++;
      counter = counter % 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color tileColor = color[counter];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: tileColor,
        child: InkWell(
          onTap: () {
            if (counter == 0) {
              widget.addUid();
            } else {
              widget.deleteUid();
            }
            return addCounter();
          },
          child: ListTile(
            leading: widget.followerListTileLeading,
            title: widget.followerListTileTitle,
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
