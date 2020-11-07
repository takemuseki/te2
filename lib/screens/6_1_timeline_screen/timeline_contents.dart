import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_functions.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_parts.dart';

class TimelineContents {
  final TimelineParts parts;
  final TimelineFunctions functions;
  TimelineContents({
    @required this.parts,
    @required this.functions,
  });

  Widget userImage({
    @required String imageUrl,
  }) {
    return parts.userImage(imageUrl: imageUrl);
  }

  Widget timelineList() {
    return FutureBuilder(
      future: functions.getTimelineMap(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        } else if (snapshot.hasError) {
          return Text("問題が発生しました。通信環境のいい場所で再度通信してください。");
        } else {
          List<QueryDocumentSnapshot> list = functions.timelineSnapshotList();
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, int i) {
              Map<String, dynamic> map = list[i].data();
              Timestamp timestamp = map["timestamp"];
              DateTime dateTime = timestamp.toDate();

              return parts.cardTile(
                sentence: map["sentence"],
                datetime: dateTime.toString(),
                userName: map["user name"],
                userImage: userImage(imageUrl: map["user image url"]),
              );
            },
          );
        }
      },
    );
  }
}
