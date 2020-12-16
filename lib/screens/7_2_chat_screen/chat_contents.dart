import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:te2/screens/7_2_chat_screen/chat_functions.dart';
import 'package:te2/screens/7_2_chat_screen/chat_parts.dart';
import 'package:te2/utils/dialog.dart';

class ChatContents {
  final ChatFunctions functions;
  final ChatParts parts;
  final TextEditingController chatEditingController = TextEditingController();
  ChatContents({
    @required this.functions,
    @required this.parts,
  });

  Widget streamChatList() {
    return StreamBuilder(
      stream: functions.chatStream(),
      builder: (context, snapshot) {
        print("stream builder builder");
        if (!snapshot.hasData) {
          return Text("loading");
        } else if (snapshot.hasError) {
          return Text("error");
        } else {
          var listMessage = snapshot.data.documents;
          return ListView.builder(
            itemCount: listMessage.length,
            reverse: true,
            itemBuilder: (context, index) => buildItem(
              index: index,
              listMessage: listMessage[index].data(),
            ),
          );
        }
      },
    );
  }

  Widget buildItem({
    @required int index,
    @required Map<String, dynamic> listMessage,
  }) {
    print("buildItem");
    if (listMessage["account"] == functions.uid()) {
      return parts.myChatListTile(text: listMessage["contents"]);
    }
    return ListTile(
      title: Text(listMessage["contents"]),
    );
  }

  Widget chatInput() {
    print("chatInput");
    return parts.chatInput(
      chatInputController: chatEditingController,
    );
  }

  Widget chatPostButton() {
    print("chatPostButton");
    return parts.chatPostButton(
      chatPost: () async {
        var _result = await functions.postChat(
            chatEditingController: chatEditingController);
        if (_result == false) {
          errorDialog(context: functions.context);
        }
        chatEditingController.clear();
      },
    );
  }
}
