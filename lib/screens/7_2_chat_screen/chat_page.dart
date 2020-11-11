import 'package:flutter/material.dart';

class ChatPage {
  Widget page({
    @required Widget chatList,
    @required Widget chatInput,
    @required Widget chatPost,
  }) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Expanded(child: chatList),
              chatInput,
              chatPost,
            ],
          ),
        ),
      ),
    );
  }
}
