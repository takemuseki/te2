import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';
import 'package:te2/utils/yet.dart';

class MailboxParts {
  final BuildContext context;
  MailboxParts({@required this.context});

  Widget makeRoomButton({
    @required VoidCallback makeChatRoom,
  }) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: makeChatRoom,
    );
  }

  Widget chatListTile({
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

  Widget chatListTileTitle({
    @required Map<String, dynamic> map,
  }) {
    print(map);
    String title = "";
    for (String key in map.keys) {
      title += map[key] + " ";
    }
    if (title == "") {
      title = "メンバーがいません";
    }
    return Text(title);
  }

  Widget chatListTileTitleError() {
    return Text("エラー");
  }

  Widget chatListError() {
    return Text("エラー");
  }

  Widget chatListWaiting() {
    return CircularProgressIndicator();
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

  Future<dynamic> bottomSheet({
  @required Map<String,dynamic> followerMap,
  @required Map<String,dynamic> userInfoMap,
}){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // ModalBottomSheet を押した時のイベントを捕まえるために
        // GestureDetector でラップする
        return GestureDetector(
          onTap: () {
            print("tap modal bottom sheet");
            // ModalBottomSheet を押した時には何もしないようにする
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 4 / 5,
            // ModalBottomSheet のどこを押してもラップした GestureDetector が
            // 検知できるように、ラップした Container には色をつけておく
            color: Colors.white,
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
                Builder(builder: (context) {
                  if (followerMap.length == 0) {
                    return Text("followerがいません");
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: userInfoMap.length,
                    itemBuilder: (context, int i) {
                      String key = userInfoMap.keys.elementAt(i);

                      return ListTile(
                        title: Text(userInfoMap[key]["user name"]),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }

}
