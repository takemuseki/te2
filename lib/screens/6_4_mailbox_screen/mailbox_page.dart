import 'package:flutter/material.dart';

class MailboxPage {
  Widget page({
    @required Widget roomListView,
    @required Widget makeChatRoomButton,
  }) {
    return Scaffold(
      body: Center(
        child: roomListView,
      ),
      floatingActionButton: makeChatRoomButton,
    );
  }
}
