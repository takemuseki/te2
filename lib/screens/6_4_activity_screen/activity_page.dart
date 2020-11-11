import 'package:flutter/material.dart';

class ActivityPage {
  final BuildContext context;
  ActivityPage({
    @required this.context,
  });
  Widget page({
    @required Widget searchButton,
    @required Widget searchInput,
    //@required Widget requestList,
    //@required Widget friendList,
  }) {
    return Center(
      child: Column(
        children: [
          SizedBox(child: searchInput),
          searchButton,
          //requestList,
          //friendList,
        ],
      ),
    );
  }
}
