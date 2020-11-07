import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_3_post_screen/post_model.dart';
import 'package:te2/screens/6_3_post_screen/post_view.dart';

class PostSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("'PostSetup");
    return Provider(
      lazy: false,
      create: (context) {
        return PostModel(
          firestoreService: context.read<MyAppModel>().firestoreService,
          uid: context.read<MaterialAppModel>().uid,
        );
      },
      builder: (context, child) {
        return PostView();
      },
    );
  }
}
