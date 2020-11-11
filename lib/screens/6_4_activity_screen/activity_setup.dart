import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_4_activity_screen/activity_model.dart';
import 'package:te2/screens/6_4_activity_screen/activity_view.dart';

class ActivitySetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("'ActivitySetup");
    return Provider(
      lazy: false,
      create: (context) {
        return ActivityModel(
          firestoreService: context.read<MyAppModel>().firestoreService,
          uid: context.read<MaterialAppModel>().uid,
          userName:
              context.read<MaterialAppModel>().oneselfInfoMap["user name"],
        );
      },
      builder: (context, child) {
        return ActivityView();
      },
    );
  }
}
