import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/7_2_chat_screen/chat_model.dart';

class ChatFunctions {
  final BuildContext context;

  ChatFunctions({
    @required this.context,
  });

  Future<dynamic> postChat({
    @required TextEditingController chatEditingController,
  }) async {
    var _result = await context
        .read<ChatModel>()
        .postChat(textEditingController: chatEditingController);
    if (_result == true) {
      return true;
    } else if (_result == "null") {
      return null;
    } else {
      return false;
    }
  }

  Stream chatStream() {
    return context.watch<ChatModel>().chatStream();
  }

  String uid() {
    return context.read<ChatModel>().uid;
  }
}
