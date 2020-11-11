import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeParts {
  final BuildContext context;
  HomeParts({
    @required this.context,
  });
  TabItem friendTab() {
    return TabItem(
      icon: Icons.people,
    );
  }

  TabItem timelineTab() {
    return TabItem(
      icon: Icons.calendar_today,
    );
  }

  TabItem cardTab() {
    return TabItem(icon: Icons.palette);
  }

  TabItem chatTab() {
    return TabItem(
      icon: Icons.chat_bubble,
    );
  }

  TabItem myPageTab() {
    return TabItem(
      icon: Icons.ac_unit,
    );
  }

  Widget convexAppBar({
    @required Function(int i) changeIndex,
  }) {
    return ConvexAppBar(
      initialActiveIndex: 2,
      style: TabStyle.fixedCircle,
      items: [
        friendTab(),
        timelineTab(),
        cardTab(),
        chatTab(),
        myPageTab(),
      ],
      onTap: (int i) => changeIndex(i),
    );
  }

  Widget homeBottomNavigationBar({
    @required int currentIndex,
    @required Function(int i) onTap,
  }) {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.red,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          title: Text("timeline"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.markunread_mailbox),
          title: Text("mailbox"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_post_office),
          title: Text("post"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_activity),
          title: Text("activity"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          title: Text("my page"),
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
    );
  }
}
