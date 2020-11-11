import 'package:flutter/material.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_setup.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_setup.dart';
import 'package:te2/screens/6_3_post_screen/post_setup.dart';
import 'package:te2/screens/6_4_activity_screen/activity_setup.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_setup.dart';

class HomeModel extends ChangeNotifier {
  dynamic page = PostSetup();
  int currentIndex = 2;

  /*final List _pages = [
    FriendPageSetup(),
    TimeLineSetup(),
    PostPageSetup(),
    ChatListPageSetup(),
    MyPageSetup(),
  ];

    final List _pages = [
    TestPageSetup(text: "timeline"),
    TestPageSetup(text: "chat"),
    TestPageSetup(text: "post"),
    TestPageSetup(text: "activity"),
    OneselfSetup(),
  ];
   */

  final Map _pageMap = {
    0: TimelineSetup(),
    1: MailboxSetup(),
    2: PostSetup(),
    3: ActivitySetup(),
    4: OneselfSetup(),
  };

  /*
  void changeIndex({@required int i}) {
    page = _pageMap[i];
    notifyListeners();
  }

   */

  void changeCurrentIndex({@required int i}) {
    currentIndex = i;
    page = _pageMap[i];
    notifyListeners();
  }
}

class TestPageSetup extends StatelessWidget {
  final String text;
  TestPageSetup({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("test$text")),
    );
  }
}
