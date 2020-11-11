import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/1_auth_process/auth_model.dart';
import 'package:te2/process/4_app_process/material_app_setup.dart';
import 'package:te2/screens/3_first_screen/first_model.dart';
import 'package:te2/screens/3_first_screen/first_view.dart';
import 'package:te2/utils/error_page.dart';
import 'package:te2/utils/loading_page.dart';

class FirstSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("'FirstSetup");
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        return FirstModel(
          uid: context.read<AuthModel>().uid(),
          firestoreService: context.read<MyAppModel>().firestoreService,
        );
      },
      builder: (context, child) {
        return FutureBuilder(
          future: Provider.of<FirstModel>(context, listen: false).getUserMap(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingPage();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              bool _first = context.watch<FirstModel>().userMap["first"];
              if (_first == true) {
                return MaterialApp(
                  home: FirstView(),
                );
              } else if (_first == false) {
                return MaterialAppSetup();
              }
              return ErrorPage(
                text: "firstが見つからない",
              );
            } else {
              return ErrorPage(
                text: "通信が行えません。",
              );
            }
          },
        );
      },
    );
  }
}
