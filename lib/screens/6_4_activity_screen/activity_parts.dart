import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';
import 'package:te2/utils/yet.dart';

class ActivityParts {
  final BuildContext context;
  ActivityParts({
    @required this.context,
  });
  Widget requestTile({
    @required Map<String, dynamic> map,
    @required VoidCallback acceptRequest,
    @required VoidCallback rejectRequest,
  }) {
    return ListTile(
      leading: yetWidget(),
      title: Text(map["user name"]),
      subtitle: yetWidget(),
      trailing: Column(
        children: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: acceptRequest,
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: rejectRequest,
          ),
        ],
      ),
    );
  }

  Widget friendTile({
    @required Map<String, dynamic> map,
  }) {
    return ListTile(
      leading: yetWidget(),
      title: Text(map["user name"]),
      subtitle: yetWidget(),
      trailing: yetWidget(),
    );
  }

  Widget searchButton({
    @required VoidCallback searchFriendUserId,
  }) {
    return RaisedButton(
      child: Text("search"),
      onPressed: searchFriendUserId,
    );
  }

  Widget noUsedId() {
    return Text("使われていないuserIdです");
  }

  Widget searchInput({
    @required TextEditingController searchInputController,
  }) {
    return TextFormField(
      controller: searchInputController,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: "user id",
        hintText: "user id 入力してください",
      ),
    );
  }

  Widget noFriend() {
    return Text("yet 友達がいません");
  }

  Widget noRequest() {
    return Text("yet 友達リクエストは届いていません");
  }

  Future<Dialog> noUsedIdDialog() {
    final Widget title = Text("使われていないUserIdです");
    final Widget content = Text("UserIdが間違っています");

    return simpleDialog(
        titleWidget: title, contentWidget: content, context: context);
  }

  Future<Dialog> failedToSearchDialog() {
    return errorDialog(context: context);
  }
}
