import 'package:flutter/material.dart';
import 'package:te2/screens/6_1_timeline_screen/timeline_setup.dart';
import 'package:te2/screens/6_2_mailbox_screen/mailbox_setup.dart';
import 'package:te2/screens/6_3_post_screen/post_setup.dart';
import 'package:te2/screens/6_4_activity_screen/activity_setup.dart';
import 'package:te2/screens/6_5_oneself_screen/oneself_setup.dart';

class HomeModel extends ChangeNotifier {
  final BuildContext context;
  HomeModel({
    @required this.context,
  });
  dynamic page = PostSetup();
  int currentIndex = 2;

  final Map _pageMap = {
    0: TimelineSetup(),
    1: MailboxSetup(),
    2: PostSetup(),
    3: ActivitySetup(),
    4: OneselfSetup(),
  };

  void changeCurrentIndex({@required int i}) {
    print("changeCurrentIndex");
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
