import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';

class HomeFunctions {
  final BuildContext context;
  HomeFunctions({@required this.context});

  void changeCurrentIndex({@required int i}) {
    context.read<HomeModel>().changeCurrentIndex(i: i);
  }

  Widget child() {
    print("child home functions");
    return context.watch<HomeModel>().page;
  }

  int currentIndex() {
    return context.select((HomeModel model) => model.currentIndex);
  }
}
