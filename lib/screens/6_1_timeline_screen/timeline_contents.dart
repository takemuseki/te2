import 'dart:js';

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

  Widget timelineList(){
    return FutureBuilder(
      future: functions.getTimelineMap(),
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Text("loading");
        } else if (snapshot.hasError){
          return Text("問題が発生しました。通信環境のいい場所で再度通信してください。");

        } else {
          Map<String,dynamic>
          return ListView.builder(
              itemBuilder: (context,int i){
            return parts.cardTile(sentence: null, timestamp: null, userName: null, userImage: null)
          })
        }
      },
    );
  }
}
