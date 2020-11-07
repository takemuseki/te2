import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class FirstParts {
  final BuildContext context;
  FirstParts({
    @required this.context,
  });

  Widget title() {
    return Text("user id の設定");
  }

  Widget sentence() {
    return Text(
        "user id の設定をしましょう。ユーザーがあなたを検索する事が出来るようになります。user id は一度設定したら変更する事が出来ません。");
  }

  Widget inputForm({
    @required TextEditingController userIdInputController,
  }) {
    return Card(
      child: TextFormField(
        controller: userIdInputController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "UserName",
          hintText: "UserNameを入力してください",
        ),
      ),
    );
  }

  Widget submitButton({
    @required VoidCallback submitUserId,
  }) {
    return IconButton(
      icon: Icon(Icons.check),
      onPressed: submitUserId,
    );
  }

  Future<Dialog> alreadyUsedDialog() {
    Widget title = Text("user id エラー");
    Widget content = Text("この user id はすでに使用されています。別の user id を使用してください");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Future<Dialog> successSubmitDialog() {
    Widget title = Text("登録完了！");
    Widget content = Text("user id の登録に成功しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Future<Dialog> failureSubmitDialog() {
    Widget title = Text("登録失敗");
    Widget content = Text("不明なエラーが起きました。");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }
}
