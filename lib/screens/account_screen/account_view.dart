import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/6_4_activity_screen/activity_functions.dart';
import 'package:te2/screens/account_screen/account_contents.dart';
import 'package:te2/screens/account_screen/account_functions.dart';
import 'package:te2/screens/account_screen/account_model.dart';
import 'package:te2/screens/account_screen/account_page.dart';
import 'package:te2/screens/account_screen/account_parts.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AccountFunctions _functions = AccountFunctions(context: context);
    AccountParts _parts = AccountParts(context: context);
    AccountContents contents =
        AccountContents(context: context, parts: _parts, functions: _functions);
    AccountPage page = AccountPage(context: context);

    return page.page2(
        userId: contents.userId(),
        popButton: contents.popButton(),
        userImage: contents.userImage(),
        userName: contents.userName(),
        statusIcon: contents.statusIcon(),
        chatButton: contents.chatButton(),
        sliverCardList: contents.sliverCardList(),
        followRequest: contents.requestButton());
  }
}
