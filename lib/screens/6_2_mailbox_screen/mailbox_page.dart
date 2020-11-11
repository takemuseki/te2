import 'package:flutter/material.dart';

class MailboxPage {
  Widget page({
    @required Widget mailbox,
    @required Widget makeChatRoomButton,
  }) {
    return Scaffold(
      body: Center(
        child: mailbox,
      ),
      floatingActionButton: makeChatRoomButton,
    );
  }
}
