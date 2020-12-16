import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class AccountParts {
  final BuildContext context;
  AccountParts({
    @required this.context,
  });

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

  Widget userId({
    @required String id,
  }) {
    print("userId");

    return Text(id);
  }

  Widget popButton({
    @required VoidCallback pop,
  }) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: pop,
    );
  }

  Widget userImage({
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

    return Padding(
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
      ),
    );
  }

  Widget statusIcon({
    @required Color color,
  }) {
    return Icon(
      Icons.account_circle,
      color: color,
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

  Widget chatButton({
    @required VoidCallback toChat,
  }) {
    return IconButton(
      icon: Icon(Icons.chat),
      onPressed: toChat,
    );
  }

  Widget card({
    @required String sentence,
  }) {
    return Card(
      child: Text(sentence),
    );
  }

  Widget followButton({
    @required VoidCallback follow,
  }) {
    return RaisedButton(
      child: Text("follow"),
      onPressed: follow,
    );
  }

  Widget unFollowButton({
    @required VoidCallback unFollow,
  }) {
    return RaisedButton(
      child: Text("unfollow"),
      onPressed: unFollow,
    );
  }

  Future<Dialog> failureFollowDialog({
    @required BuildContext context,
  }) {
    return simpleDialog(
      titleWidget: Text("フォロー失敗"),
      contentWidget: Text("フォローに失敗しました"),
      context: context,
    );
  }

  Future<Dialog> failureUnFollowDialog({
    @required BuildContext context,
  }) {
    return simpleDialog(
      titleWidget: Text("アンフォロー失敗"),
      contentWidget: Text("アンフォローに失敗しました"),
      context: context,
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
}
