import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/account_screen/account_model.dart';
import 'package:te2/screens/account_screen/account_view.dart';

class AccountSetup extends StatelessWidget {
  final Map<String, dynamic> accountInfo;
  AccountSetup({
    @required this.accountInfo,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) {
        bool followBoolean;
        Map<String, dynamic> followsMap =
            context.read<MaterialAppModel>().followsUidMap;
        print(followsMap);
        if (followsMap[accountInfo["uid"]] != null) {
          followBoolean = true;
        } else {
          followBoolean = false;
        }
        return AccountModel(
          followBoolean: followBoolean,
          infoMap: accountInfo,
          firestoreService: context.read<MyAppModel>().firestoreService,
          uid: context.read<MaterialAppModel>().uid,
        );
      },
      builder: (context, child) {
        return AccountView();
      },
    );
  }
}
