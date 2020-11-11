import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/common/theme/theme.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/3_first_screen/first_model.dart';
import 'package:te2/screens/5_home_screen/home_setup.dart';
import 'package:te2/screens/7_1_account_screen/account_setup.dart';
import 'package:te2/screens/7_2_chat_screen/chat_setup.dart';

class MaterialAppSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      lazy: false,
      create: (context) => MaterialAppModel(
        firestoreService: context.read<MyAppModel>().firestoreService,
        uid: context.read<FirstModel>().uid,
        oneselfInfoMap: context.read<FirstModel>().userMap,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              {
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => HomeSetup(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                );
              }
            case '/accountPage':
              {
                final Map<String, dynamic> accountInfo = settings.arguments;
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => AccountSetup(
                    accountInfo: accountInfo,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeUpwardsPageTransitionsBuilder().buildTransitions(
                      MaterialPageRoute(
                        builder: (context) => AccountSetup(
                          accountInfo: accountInfo,
                        ),
                      ),
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    );
                  },
                );
              }
            case '/chatPage':
              {
                final ChatRoomInformation _chatRoomInformation =
                    settings.arguments;
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ChatSetup(
                    chatRoomInformation: _chatRoomInformation,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return OpenUpwardsPageTransitionsBuilder().buildTransitions(
                      MaterialPageRoute(
                        builder: (context) => ChatSetup(
                          chatRoomInformation: _chatRoomInformation,
                        ),
                      ),
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    );
                  },
                );
              }
            default:
              {
                return MaterialPageRoute(builder: (context) => HomeSetup());
              }
          }
        },
      ),
    );
  }
}
