import 'package:flutter/material.dart';
import 'package:te2/screens/6_4_activity_screen/activity_contents.dart';
import 'package:te2/screens/6_4_activity_screen/activity_functions.dart';
import 'package:te2/screens/6_4_activity_screen/activity_page.dart';
import 'package:te2/screens/6_4_activity_screen/activity_parts.dart';

class ActivityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ActivityView");
    ActivityParts _parts = ActivityParts(context: context);
    ActivityFunctions _functions = ActivityFunctions(context: context);
    ActivityContents contents =
        ActivityContents(parts: _parts, functions: _functions);
    ActivityPage page = ActivityPage(context: context);

    return page.page(
      searchButton: contents.searchButton(),
      searchInput: contents.searchInput(),
    );
  }
}
