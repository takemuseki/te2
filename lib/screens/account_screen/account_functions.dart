import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/account_screen/account_model.dart';

class AccountFunctions {
  final BuildContext context;
  AccountFunctions({
    @required this.context,
  });
  Future<void> updateFollowBoolean() async {
    print("updateFollowBoolean");
    Map<String, dynamic> followsMap =
        await context.read<MaterialAppModel>().newFollowsUidMap();
    print("updateFollowBoolean end");
    return context.read<AccountModel>().changeFollowBoolean(map: followsMap);
  }

  Future<dynamic> follow() async {
    print("follow functions");
    return await context.read<AccountModel>().follow();
  }

  Future<dynamic> unFollow() async {
    print("unfollow functions");
    return await context.read<AccountModel>().unFollow();
  }

  Future<QuerySnapshot> getCardMap() async {
    return await Provider.of<AccountModel>(context, listen: false).getCardMap();
  }

  String userId() {
    print("functions userId");
    return context.select((AccountModel model) => model.infoMap["user id"]);
  }

  String imageUrl() {
    print("image Url");
    return context.select((AccountModel model) => model.infoMap["image"]);
  }

  String userName() {
    return context.select((AccountModel model) => model.infoMap["user name"]);
  }
}
