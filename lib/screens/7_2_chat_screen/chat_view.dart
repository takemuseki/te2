import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/7_2_chat_screen/chat_contents.dart';
import 'package:te2/screens/7_2_chat_screen/chat_functions.dart';
import 'package:te2/screens/7_2_chat_screen/chat_page.dart';
import 'package:te2/screens/7_2_chat_screen/chat_parts.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("chatView");
    final ChatParts _parts = ChatParts(context: context);
    final ChatFunctions _functions = ChatFunctions(context: context);
    final ChatContents contents =
        ChatContents(parts: _parts, functions: _functions);
    final ChatPage _page = ChatPage();
    return _page.page(
      chatList: contents.streamChatList(),
      chatInput: contents.chatInput(),
      chatPost: contents.chatPostButton(),
    );
  }
}
