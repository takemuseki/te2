import 'package:flutter/material.dart';

class TimelineParts {
  final BuildContext context;
  TimelineParts({
    @required this.context,
  });
  Widget cardTile({
    @required String sentence,
    @required String timestamp,
    @required String userName,
    @required Widget userImage,
  }) {
    return Card(
      child: ListTile(
        leading: Text(userName),
        title: Text(sentence),
        subtitle: Text(timestamp),
      ),
    );
  }
}
