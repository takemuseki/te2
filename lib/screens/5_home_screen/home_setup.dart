import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/5_home_screen/home_view.dart';

class HomeSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        context.read<MaterialAppModel>().newFollowersUidMap();
        context.read<MaterialAppModel>().newFollowsUidMap();
        return HomeModel(context: context);
      },
      builder: (context, child) {
        return HomeView();
      },
    );
  }
}
