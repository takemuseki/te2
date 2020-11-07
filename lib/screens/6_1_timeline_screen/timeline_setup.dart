import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_model.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_view.dart';

class TimelineSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => TimelineModel(
        firestoreService: context.read<MyAppModel>().firestoreService,
        uid: context.read<MaterialAppModel>().uid,
      ),
      builder: (context, child) {
        return TimelineView();
      },
    );
  }
}
