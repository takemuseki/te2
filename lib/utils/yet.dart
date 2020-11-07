import 'package:flutter/material.dart';

Future<dynamic> yetDialog({
  @required BuildContext context,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("これから実装します"),
        children: <Widget>[
          // コンテンツ領域
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context),
            child: Text("これから実装します"),
          ),
        ],
      );
    },
  );
}

Widget yetWidget() {
  return Container(
    child: Center(
      child: Text("yet"),
    ),
  );
}

class YetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("まだ実装していません"),
      ),
    );
  }
}
