import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:te2/utils/yet.dart';

class OneselfPage {
  final BuildContext context;
  OneselfPage({@required this.context});
  Widget page({
    @required Widget userImage,
    @required Widget userId,
    @required Widget userName,
    @required Widget settingsButton,
    @required Widget sliverCardList,
  }) {
    print("oneself page page");
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          onStretchTrigger: () {
            //todo これから実装します
            print("これから実装します");
            yetDialog(context: context);
            return;
          },
          title: userName,
          leading: settingsButton,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: userName,
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
                  height: 30,
                ),
                userImage,
                SizedBox(
                  height: 20,
                ),
                userId,
              ],
            ),
          ),
          expandedHeight: 270,
        ),
        sliverCardList,
      ],
    );
  }

  Widget page2({
    @required Widget userImage,
    @required Widget userId,
    @required Widget userName,
    @required Widget settingsButton,
    @required Widget sliverCardList,
  }) {
    print("oneself page page");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: userName,
        leading: settingsButton,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            pinned: true,
            onStretchTrigger: () {
              //todo これから実装します
              print("これから実装します");
              yetDialog(context: context);
              return;
            },
            leading: settingsButton,
            flexibleSpace: FlexibleSpaceBar(
              title: userId,
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
                    height: 30,
                  ),
                  userImage,
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            expandedHeight: 220,
          ),
          sliverCardList,
        ],
      ),
    );
  }
}

class OneselfPageTest extends StatelessWidget {
  final Widget userName;
  final Widget settingsButton;
  final Widget userImage;
  final Widget userId;
  final Widget sliverCardList;
  OneselfPageTest({
    @required this.userName,
    @required this.settingsButton,
    @required this.userImage,
    @required this.userId,
    @required this.sliverCardList,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          stretch: true,
          pinned: true,
          onStretchTrigger: () {
            //todo これから実装します
            print("これから実装します");
            yetDialog(context: context);
            return;
          },
          leading: settingsButton,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: userName,
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
                  height: 30,
                ),
                userImage,
                SizedBox(
                  height: 20,
                ),
                userId,
              ],
            ),
          ),
          expandedHeight: 270,
        ),
        sliverCardList,
      ],
    );
  }
}
