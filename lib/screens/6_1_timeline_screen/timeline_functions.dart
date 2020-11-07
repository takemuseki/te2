import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_model.dart';

class TimelineFunctions {
  final BuildContext context;
  TimelineFunctions({@required this.context});

  Future<dynamic> getTimelineMap() async {
    return await context.watch<TimelineModel>().getTimeline();
  }

  List<QueryDocumentSnapshot> timelineSnapshotList() {
    return context.read<TimelineModel>().timelineSnapshotList;
  }
}
