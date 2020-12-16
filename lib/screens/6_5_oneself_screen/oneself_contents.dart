import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_functions.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_parts.dart';

class OneselfContents {
  final OneselfParts parts;
  final OneselfFunctions functions;
  OneselfContents({
    @required this.parts,
    @required this.functions,
  });

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

  Widget userName() {
    return parts.userName(
      name: functions.userName(),
    );
  }

  Widget userImage() {
    print("contents userImage");
    return Consumer<MaterialAppModel>(
      builder: (context, model, _) {
        return parts.userImage(
          imageUrl: functions.imageUrl(),
          addImage: () async {
            dynamic result = await functions.selectImage();
            if (result == "null") {
              return null;
            } else if (result is Map<String, File>) {
              //todo update中どうするか。
              dynamic result2 =
                  await functions.uploadUserImage(uploadImageMap: result);
              if (result2 == false) {
                return parts.uploadErrorDialog();
              }
            } else {
              return parts.selectErrorDialog();
            }
          },
        );
      },
    );
  }

  Widget userId() {
    return parts.userId(
      id: functions.userId(),
    );
  }

  Widget settingsButton() {
    return parts.settingsButton(
      signOut: () {
        functions.signOut();
      },
    );
  }
}
