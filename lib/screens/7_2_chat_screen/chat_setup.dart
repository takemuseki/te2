import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/7_2_chat_screen/chat_contents.dart';
import 'package:te2/screens/7_2_chat_screen/chat_functions.dart';
import 'package:te2/screens/7_2_chat_screen/chat_model.dart';
import 'package:te2/screens/7_2_chat_screen/chat_parts.dart';
import 'package:te2/screens/7_2_chat_screen/chat_view.dart';

class ChatSetup extends StatelessWidget {
  final ChatRoomInformation chatRoomInformation;
  ChatSetup({
    @required this.chatRoomInformation,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatModel(
        firestoreService: context.read<MyAppModel>().firestoreService,
        chatRoomId: chatRoomInformation.chatRoomId,
        uid: context.read<MaterialAppModel>().uid,
        lastUpdateTime: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
      builder: (context, child) {
        return ChatView();
      },
    );
  }
}
