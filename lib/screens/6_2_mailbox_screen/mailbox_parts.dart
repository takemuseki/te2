import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';
import 'package:te2/utils/yet.dart';

class MailboxParts {
  final BuildContext context;
  MailboxParts({@required this.context});

  Widget mailboxWaiting() {
    return CircularProgressIndicator();
  }

  Widget emptyMailbox() {
    return Text("mailboxが空です");
  }

  Widget mailboxListTitleError() {
    return Text("エラー");
  }

  Widget mailboxTile({
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

  Widget makeRoomButton({
    @required VoidCallback makeChatRoom,
  }) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: makeChatRoom,
    );
  }

  Widget mailboxListTileTitle({
    @required Map<String, dynamic> map,
  }) {
    print("mailboxListTileTitle parts");
    String title = "";
    if (map.length != 0) {
      for (String key in map.keys) {
        title = title + " (indent) " + map[key];
      }
    }
    return Text(title);
  }

  Widget followerListError() {
    return Text("エラー");
  }

  Future<Dialog> successDialog() {
    return simpleDialog(
      titleWidget: Text("seikou"),
      contentWidget: Text("seikou"),
      context: context,
    );
  }

  Future<Dialog> failureDialog() {
    return errorDialog(context: context);
  }

  Widget followerListLeading({
    @required String imageUrl,
  }) {
    return CircularProfileAvatar(
      imageUrl,
      radius: 60,
      initialsText: Text(
        "No image",
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

  Widget noFollower() {
    return Text("followerがいません");
  }

  Widget getFollowerMapError() {
    return Text("followerの取得に失敗しました");
  }

  Widget bottomSheet({
    @required dynamic bottomSheetList,
  }) {
    return GestureDetector(
      onTap: () {
        print("tap modal bottom sheet gesture detector");
        // ModalBottomSheet を押した時には何もしないようにする
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 4 / 5,
        // ModalBottomSheet のどこを押してもラップした GestureDetector が
        // 検知できるように、ラップした Container には色をつけておく
        color: Colors.blue,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("トークルームを作成"),
                RaisedButton(
                  child: Text("作成"),
                  onPressed: () {
                    return yetDialog(context: context);
                  },
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

  Widget followerListTile({
    @required Widget followerListTileTitle,
    @required Widget followerListTileLeading,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          print("followerListTile onTap");
        },
        child: ListTile(
          leading: followerListTileLeading,
          title: followerListTileTitle,
        ),
      ),
    );
  }
}
