import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/screens/5_home_screen/home_contents.dart';
import 'package:te2/screens/5_home_screen/home_functions.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/5_home_screen/home_page.dart';
import 'package:te2/screens/5_home_screen/home_parts.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("'HomeView");
    final parts = HomeParts(context: context);
    final functions = HomeFunctions(context: context);
    final contents = HomeContents(
      functions: functions,
      parts: parts,
    );
    final page = HomePage();

    return page.page(
      child: contents.child(),
      bottomNavigationBar: contents.homeBottomNavigationBar(),
    );
  }
}
