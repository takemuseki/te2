import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:te2/process/1_auth_process/auth_model.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_model.dart';

class OneselfFunctions {
  final BuildContext context;
  OneselfFunctions({@required this.context});
  void signOut() {
    context.read<AuthModel>().signOut();
  }

  String imageUrl() {
    print("functions imageUrl");
    return context.read<MaterialAppModel>().oneselfInfoMap["image"];
  }

  String userId() {
    print("functions userId");
    return context.select(
      (MaterialAppModel model) => model.oneselfInfoMap["user id"],
    );
  }

  String userName() {
    print("functions userName");
    return context.select(
      (MaterialAppModel model) => model.oneselfInfoMap["user name"],
    );
  }

  Future<QuerySnapshot> getCardMap() {
    print("functions getCardMap");
    return Provider.of<OneselfModel>(context, listen: false).getCardMap();
  }

  Map<String, dynamic> getCardMapCache() {
    return context.watch<MaterialAppModel>().oneselfCardsMap;
  }

  Future<dynamic> uploadUserImage() async {
    dynamic _result = await context.read<OneselfModel>().uploadUserImage();
    if (_result == "null") {
      return "null";
    } else if (_result == true) {
      return true;
    } else {
      return "uploadError";
    }
  }

  Future<dynamic> updateOneselfInfo({
    @required Map<String, dynamic> map,
  }) async {
    Map<String, dynamic> _map = map;
    if (context.read<OneselfModel>().downloadUrlTemp.isNotEmpty) {
      _map.addAll({
        "image": context.read<OneselfModel>().downloadUrlTemp,
      });
      context.read<OneselfModel>().emptyTheUrl();
    }
    await context.read<MaterialAppModel>().updateOneselfInfoMap(map: map);
  }
}
