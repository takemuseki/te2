import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class OneselfParts {
  final BuildContext context;
  OneselfParts({@required this.context});
  Widget userImage({
    @required String imageUrl,
    @required VoidCallback addImage,
  }) {
    print("userImage");
    String initialText;
    if (imageUrl == "") {
      initialText = "No Image";
    } else {
      initialText = "Loading";
    }

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProfileAvatar(
            imageUrl,
            radius: 60,
            initialsText: Text(
              initialText,
              style: TextStyle(fontSize: 20),
            ),
            borderColor: Theme.of(context).accentColor,
            cacheImage: true,
            onTap: addImage,
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: ButtonTheme(
            minWidth: 25,
            child: RaisedButton(
              padding: const EdgeInsets.all(0),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              color: Colors.lightBlue,
              shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.white,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              onPressed: addImage,
            ),
          ),
        ),
      ],
    );
  }

  Widget userName({
    @required String name,
  }) {
    print("userName");

    return Text(
      name,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget userId({
    @required String id,
  }) {
    print("userId");

    return Text(id);
  }

  Widget settingsButton({
    @required VoidCallback signOut,
  }) {
    print("settingsButton");

    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: signOut,
    );
  }

  Widget loadingError() {
    print("loadingError");

    return Text("カードを取得できません");
  }

  Widget loading() {
    print("loading");
    return Text("ロード中...");
  }

  Future<Dialog> uploadWaiting() {
    final Widget title = Text("画像をupload中です");
    final Widget content = Text("uploadが終了すると反映されます");
    return simpleDialog(
        titleWidget: title, contentWidget: content, context: context);
  }

  Widget cardListTile({
    @required String time,
    @required String sentence,
  }) {
    print("cardListTile");

    return Container(
      height: 150,
      child: Card(
        child: ListTile(
          leading: Text(time),
          title: Text(sentence),
        ),
      ),
    );
  }

  Future<Dialog> uploadErrorDialog() {
    final Widget title = Text("upload error");
    final Widget content = Text("uploadできませんでした。通信環境を確認してください。");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Future<Dialog> selectErrorDialog() {
    return errorDialog(context: context);
  }
}
