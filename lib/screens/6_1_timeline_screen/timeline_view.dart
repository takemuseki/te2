import 'package:flutter/material.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_contents.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_functions.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_page.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_parts.dart';

class TimelineView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TimelineParts _parts = TimelineParts(context: context);
    TimelineFunctions _functions = TimelineFunctions(context: context);
    TimelineContents contents =
        TimelineContents(parts: _parts, functions: _functions);
    TimelinePage page = TimelinePage();

    return page.page(listView: contents.timelineList());
  }
}
