import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/5_home_screen/home_view.dart';

class HomeSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => HomeModel(),
      builder: (context, child) {
        return HomeView();
      },
    );
  }
}
