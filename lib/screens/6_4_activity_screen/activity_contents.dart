import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/screens/6_4_activity_screen/activity_functions.dart';
import 'package:te2/screens/6_4_activity_screen/activity_model.dart';
import 'package:te2/screens/6_4_activity_screen/activity_parts.dart';
import 'package:te2/utils/yet.dart';

class ActivityContents {
  final ActivityParts parts;
  final ActivityFunctions functions;
  final TextEditingController searchInputController = TextEditingController();
  ActivityContents({
    @required this.parts,
    @required this.functions,
  });

  /*
   Widget _requestsList({
    @required Map<String, dynamic> snapshotMap,
  }) {
    if (snapshotMap.length == 0) {
      return noRequest();
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(36.0),
        shrinkWrap: true,
        itemCount: snapshotMap.length,
        itemBuilder: (BuildContext context, int i) {
          String _key = snapshotMap.keys.elementAt(i);
          Map<String, dynamic> _map = snapshotMap[_key];
          return requestTile(
            map: _map,
            acceptRequest: () {
              functions.acceptFriendRequest(
                friendUid: _map["uid"],
                friendUserName: _map["user name"],
              );
            },
            rejectRequest: () {
              functions.rejectFriendRequest(
                friendUid: _map["uid"],
              );
            },
          );
        },
      );
    }
  }


  //friendListの作成。
  Widget friendsList({
    @required Map<String, dynamic> snapshotMap,
  }) {
    if (snapshotMap.length == 0) {
      return noFriend();
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(36.0),
        shrinkWrap: true,
        itemCount: snapshotMap.length,
        itemBuilder: (BuildContext context, int i) {
          String _key = snapshotMap.keys.elementAt(i);
          Map<String, dynamic> _map = snapshotMap[_key];
          return friendTile(
            map: _map,
          );
        },
      );
    }
  }

   */
  /*

  //friendListのfuture処理。
  Widget futureFriendList() {
    return FutureBuilder(
      future:
          Provider.of<ActivityModel>(context, listen: false).getFriendsList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return circleLoading();
        }
        if (snapshot.hasData) {
          return friendsList(
            snapshotMap: snapshot.data,
          );
        } else if (snapshot.hasError) {
          return failureLoading();
        } else {
          return nullLoading();
        }
      },
    );
  }

   */

  /*
  //requestsListのfuture処理。
  Widget futureRequestsList() {
    return FutureBuilder(
      future:
          Provider.of<FriendPageModel>(context, listen: false).getRequestList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return parts.circleLoading();
        }
        if (snapshot.hasData) {
          return _requestsList(snapshotMap: snapshot.data);
        } else if (snapshot.hasError) {
          return failureLoading();
        } else {
          print("else");
          return nullLoading();
        }
      },
    );
  }

   */

  Widget searchButton() {
    return parts.searchButton(
      searchFriendUserId: () async {
        if (searchInputController.text.isEmpty) {
          print("text.isEmpty");
          return null;
        }
        if (searchInputController.text == functions.userId()) {
          return functions.toMyPage();
        }
        print("searchButton onTap");
        dynamic result = await functions.searchFriendUserId(
          searchInputController: searchInputController,
        );
        if (result == "null") {
          print("null");
          return parts.noUsedIdDialog();
        } else if (result.data() is Map<String, dynamic>) {
          print("success");
          print(result);
          print(result.data());
          functions.toAccountScreen(map: result.data());
        } else {
          print("error");
          return parts.failedToSearchDialog();
        }
      },
    );
  }

  Widget searchInput() {
    return parts.searchInput(
      searchInputController: searchInputController,
    );
  }
}
