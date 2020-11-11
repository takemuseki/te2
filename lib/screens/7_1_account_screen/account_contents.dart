import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/7_1_account_screen/account_functions.dart';
import 'package:te2/screens/7_1_account_screen/account_model.dart';
import 'package:te2/screens/7_1_account_screen/account_parts.dart';
import 'package:te2/utils/yet.dart';

class AccountContents {
  final BuildContext context;
  final AccountFunctions functions;
  final AccountParts parts;
  AccountContents({
    @required this.context,
    @required this.functions,
    @required this.parts,
  });

  Widget popButton() {
    return parts.popButton(
      pop: () {
        return Navigator.pop(context);
      },
    );
  }

  Widget userImage() {
    return parts.userImage(
      imageUrl: functions.imageUrl(),
    );
  }

  Widget userName() {
    return parts.userName(
      name: functions.userName(),
    );
  }

  Widget statusIcon() {
    return parts.statusIcon(color: Colors.red);
  }

  Widget chatButton() {
    return parts.chatButton(
      toChat: () {
        return yetDialog(context: context);
        /*
      Navigator.pushReplacementNamed(
        context,
        '/chatPage',
        arguments: context.read<AccountPageModel>().infoMap,
      );

       */
      },
    );
  }

  Widget userId() {
    return parts.userId(
      id: functions.userId(),
    );
  }

  Widget sliverCardList() {
    print("sliverCardList");
    return FutureBuilder(
      future: functions.getCardMap(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ListTile(
                  title: parts.loading(),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                ListTile(
                  title: parts.loadingError(),
                ),
              ],
            ),
          );
        } else {
          final List<DocumentSnapshot> cardDocumentMap = snapshot.data.docs;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                Map<String, dynamic> cardInfo = cardDocumentMap[i].data();
                return parts.cardListTile(
                  time: cardInfo["time"].toString(),
                  sentence: cardInfo["sentence"],
                );
              },
              childCount: cardDocumentMap.length,
            ),
          );
        }
      },
    );
  }

  Widget requestButton() {
    return Consumer<AccountModel>(
      builder: (context, model, child) {
        if (model.followBoolean == false) {
          return parts.followButton(
            follow: () async {
              print("follow");
              await functions.follow();
              return functions.updateFollowBoolean();
            },
          );
        } else {
          return parts.unFollowButton(
            unFollow: () async {
              print("unfollow");
              await functions.unFollow();
              return functions.updateFollowBoolean();
            },
          );
        }
      },
    );
  }
}
