import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class ChatParts {
  final BuildContext context;
  ChatParts({@required this.context});
  Widget chatListTile({
    @required String test,
  }) {
    return ListTile(
      title: Text(test),
    );
  }

  Widget myChatListTile({
    @required String text,
  }) {
    return Container(
      color: Colors.red,
      child: ListTile(
        title: Text(text),
      ),
    );
  }

  Widget chatInput({
    @required TextEditingController chatInputController,
  }) {
    return Card(
      child: TextFormField(
        controller: chatInputController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "chat",
          hintText: "chat",
        ),
      ),
    );
  }

  Widget chatPostButton({
    @required VoidCallback chatPost,
  }) {
    return FlatButton(
      onPressed: chatPost,
      child: Text("post"),
    );
  }

  Future<Dialog> postErrorDialog({
    @required BuildContext context,
  }) {
    return simpleDialog(
      titleWidget: Text("エラー"),
      contentWidget: Text("chatが送れません"),
      context: context,
    );
  }
}
