import 'package:flutter/material.dart';

Future<Dialog> simpleDialog({
  @required Widget titleWidget,
  @required Widget contentWidget,
  @required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: titleWidget,
        children: <Widget>[
          // コンテンツ領域
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: contentWidget,
          ),
        ],
      );
    },
  );
}

Future<Dialog> errorDialog({
  @required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("不明なエラー"),
        children: <Widget>[
          // コンテンツ領域
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text("不明なエラーが発生しました。通信環境のいい場所でリトライしてください"),
          ),
        ],
      );
    },
  );
}

Future<Widget> dialog({
  @required BuildContext context,
  @required Widget child,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return child;
    },
  );
}
