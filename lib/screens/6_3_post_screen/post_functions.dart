import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/5_home_screen/home_model.dart';
import 'package:te2/screens/6_3_post_screen/post_model.dart';

class PostFunctions {
  final BuildContext context;
  PostFunctions({
    @required this.context,
  });

  Future<dynamic> addCard(
      {@required TextEditingController sentenceController}) async {
    print("_addCard");
    final Timestamp timestamp = Timestamp.now();

    //todo 実験的にtimeは3としている。
    final Map<String, dynamic> cardMap = CardInfo(
      uid: context.read<PostModel>().uid,
      userName: context.read<MaterialAppModel>().oneselfInfoMap["user name"],
      userImageUrl: context.read<MaterialAppModel>().oneselfInfoMap["image"],
      sentence: sentenceController.text,
      time: 3,
      timestamp: timestamp,
      cardImageUrl: "",
    ).map();

    var result = await context.read<PostModel>().addCardToUsers(map: cardMap);
    print(result);
    print("result");

    if (result == true) {
      print(true);
      DocumentSnapshot documentSnapshot =
          await context.read<MyAppModel>().firestoreService.getDocument(
                collectionName: "Followers",
                documentName: context.read<PostModel>().uid,
              );
      Map<String, dynamic> followerMap = documentSnapshot.data();
      print(documentSnapshot);
      print(followerMap);
      print("result2");

      var result2 = await context.read<PostModel>().addCardToTimeline(
            map: cardMap,
            followerMapUid: followerMap,
          );
      print(result2);
      if (result2 == true) {
        return true;
      } else {
        return "failed to add card to followers";
      }
    } else {
      print("エラー");
      return "failed to add card to users";
    }
  }

  void changeCurrentIndex() {
    context.read<HomeModel>().changeCurrentIndex(i: 0);
  }
}
