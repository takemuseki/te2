import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_model.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_view.dart';

class OneselfSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("oneself setup");
    return Provider(
      create: (context) {
        print("oneself model");
        return OneselfModel(
          firestoreService: context.read<MyAppModel>().firestoreService,
          fireStorageService: context.read<MyAppModel>().fireStorageService,
          imageSelectorService: context.read<MyAppModel>().imageSelectorService,
          uid: context.read<MaterialAppModel>().uid,
        );
      },
      builder: (context, child) {
        print("oneself view");
        return OneselfView();
      },
    );
  }
}
