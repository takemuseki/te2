import 'package:flutter/material.dart';
import 'package:te2/screens/5_home_screen/home_functions.dart';
import 'package:te2/screens/5_home_screen/home_parts.dart';

class HomeContents {
  final HomeParts parts;
  final HomeFunctions functions;
  HomeContents({
    @required this.parts,
    @required this.functions,
  });

  Widget child() {
    print("child home contents");
    return functions.child();
  }

  Widget homeBottomNavigationBar() {
    return parts.homeBottomNavigationBar(
      currentIndex: functions.currentIndex(),
      onTap: (int i) {
        print("onTap");
        functions.changeCurrentIndex(i: i);
      },
    );
  }
}
