import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/yet.dart';

class TimelineParts {
  final BuildContext context;
  TimelineParts({
    @required this.context,
  });
  Widget cardTile({
    @required String sentence,
    @required String datetime,
    @required String userName,
    @required Widget userImage,
  }) {
    return Card(
      child: ListTile(
        title: Text(sentence),
        leading: userImage,
        trailing: Text(userName),
        subtitle: Text(datetime),
      ),
    );
  }

  Widget userImage({
    @required String imageUrl,
  }) {
    print("userImage");

    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: CircularProfileAvatar(
          imageUrl,
          radius: 30,
          initialsText: Text(
            "",
            style: TextStyle(fontSize: 20),
          ),
          borderColor: Theme.of(context).accentColor,
          cacheImage: true,
          onTap: () {
            return yetDialog(context: context);
          },
        ),
      ),
    );
  }
}
