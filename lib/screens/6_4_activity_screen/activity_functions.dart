import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/6_4_activity_screen/activity_model.dart';

class ActivityFunctions {
  final BuildContext context;
  ActivityFunctions({
    @required this.context,
  });

  /*
  Future<void> acceptFriendRequest({
    @required String friendUid,
    @required String friendUserName,
  }) async {
    print("acceptFriendRequest");
    var result = await context.read<ActivityModel>().addFriendUser(
          friendUid: friendUid,
          friendUserName: friendUserName,
        );
    if (result == true) {
      simpleDialog(
        titleWidget: Text("成功"),
        contentWidget: Text("friend登録完了"),
        context: context,
      );
    } else {
      print(result);
      errorDialog(context: context);
    }
  }

  Future<void> rejectFriendRequest({
    @required String friendUid,
  }) async {
    print("rejectFriendRequest");
    var result = await context
        .read<FriendPageModel>()
        .deleteFriendRequest(friendUid: friendUid);
    if (result != true) {
      print(result);
      errorDialog(context: context);
    }
  }

   */

  Future<dynamic> searchFriendUserId({
    @required TextEditingController searchInputController,
  }) async {
    print("searchFriendUserIdが押されました");
    return await context.read<ActivityModel>().searchFriendUserId(
          friendUserId: searchInputController.text,
        );
  }

  String userId() {
    return context.read<MaterialAppModel>().oneselfInfoMap["user id"];
  }

  void toMyPage() {
    return context.read<HomeModel>().changeCurrentIndex(i: 4);
  }

  Future<void> sendFriendRequest({
    @required String friendUserId,
  }) async {
    print("sendFriendRequest");
    return await context.read<ActivityModel>().sendFriendRequest(
          friendUid: friendUserId,
        );
  }

  Future<Object> toAccountScreen({
    @required Map<String, dynamic> map,
  }) {
    return Navigator.pushNamed(context, '/accountPage', arguments: map);
  }
}
