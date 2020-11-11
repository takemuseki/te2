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
    print("userImage contents");
    return parts.userImage(imageUrl: imageUrl);
  }

  Widget timelineList() {
    print("timelineList contents");
    return FutureBuilder(
      future: functions.getTimelineMap(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("snapshot waiting");
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          print("snapshot hasError");
          return Text("問題が発生しました。通信環境のいい場所で再度通信してください。");
        } else {
          print("snapshot else");
          List<QueryDocumentSnapshot> list = functions.timelineSnapshotList();
          print("list");
          print(list);
          if (list.length == 0) {
            return Center(child: Text("timelineが空です"));
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, int i) {
              Map<String, dynamic> map = list[i].data();
              return timelineListChild(documentId: map["document id"]);
            },
          );
        }
      },
    );
  }

  Widget timelineListChild({
    @required String documentId,
  }) {
    return FutureBuilder(
      future: functions.getCard(documentId: documentId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return parts.loading();
        } else if (snapshot.hasError) {
          return parts.error();
        } else {
          final Map<String, dynamic> map = snapshot.data;

          return parts.cardTileChild(
            sentence: map["sentence"],
            datetime: map["timestamp"].toDate().toString(),
            userName: map["user name"],
            userImage: map["user image"],
          );
        }
      },
    );
  }
}
