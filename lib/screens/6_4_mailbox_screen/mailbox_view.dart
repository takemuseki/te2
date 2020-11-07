import 'package:flutter/material.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_contents.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_functions.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_page.dart';
import 'package:te2/screens/6_4_mailbox_screen/mailbox_parts.dart';

class MailboxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MailboxParts _parts = MailboxParts(context: context);
    MailboxFunctions _functions = MailboxFunctions(context: context);
    MailboxContents contents =
        MailboxContents(parts: _parts, functions: _functions);
    MailboxPage page = MailboxPage();

    return page.page(
      roomListView: contents.futureChatRoomListView(),
      makeChatRoomButton: contents.makeRoomButtonContents(),
    );
  }
}
