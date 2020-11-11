import 'package:flutter/material.dart';
import 'package:te2/utils/yet.dart';

class AccountPage {
  final BuildContext context;
  AccountPage({
    @required this.context,
  });
  Widget page({
    @required Widget popButton,
    @required Widget userImage,
    @required Widget userName,
    @required Widget statusIcon,
    @required Widget chatButton,
    @required Widget cardView,
    @required Widget followRequest,
  }) {
    return Scaffold(
      body: Column(
        children: [
          popButton,
          userImage,
          followRequest,
          statusIcon,
          userName,
          chatButton,
          cardView,
        ],
      ),
    );
  }

  Widget page2({
    @required Widget popButton,
    @required Widget userImage,
    @required Widget userName,
    @required Widget userId,
    @required Widget statusIcon,
    @required Widget chatButton,
    @required Widget sliverCardList,
    @required Widget followRequest,
  }) {
    print("oneself page page");
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: userName,
              centerTitle: true,
              stretch: true,
              pinned: true,
              onStretchTrigger: () {
                //todo これから実装します
                print("これから実装します");
                yetDialog(context: context);
                return;
              },
              leading: popButton,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                stretchModes: <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    userImage,
                    SizedBox(
                      height: 20,
                    ),
                    userId,
                    statusIcon,
                    followRequest,
                  ],
                ),
              ),
              expandedHeight: 300,
            ),
            sliverCardList,
          ],
        ),
      ),
    );
  }
}
