import 'package:flutter/material.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_contents.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_functions.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_page.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_parts.dart';

class OneselfView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OneselfParts _parts = OneselfParts(context: context);
    OneselfFunctions _functions = OneselfFunctions(context: context);
    OneselfContents contents =
        OneselfContents(parts: _parts, functions: _functions);
    OneselfPage _page = OneselfPage(context: context);

    print("oneself view build内");

    return _page.page(
      userImage: contents.userImage(),
      userId: contents.userId(),
      userName: contents.userName(),
      settingsButton: contents.settingsButton(),
      sliverCardList: contents.sliverCardList(),
    );
  }
}
