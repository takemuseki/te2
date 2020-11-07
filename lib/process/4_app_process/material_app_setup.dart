import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/common/theme/theme.dart';
import 'package:te2/main.dart';
import 'package:te2/process/4_app_process/material_app_model.dart';
import 'package:te2/screens/3_first_screen/first_model.dart';
import 'package:te2/screens/5_home_screen/home_setup.dart';

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
            /*
            case '/accountPage':
              {
                final AccountInformation _accountInformation = settings.arguments;
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => AccountPageSetup(
                    accountInformation: _accountInformation,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeUpwardsPageTransitionsBuilder().buildTransitions(
                      MaterialPageRoute(
                        builder: (context) => AccountPageSetup(
                          accountInformation: _accountInformation,
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
                  pageBuilder: (_, __, ___) => ChatRoomPageSetup(
                    chatRoomInformation: _chatRoomInformation,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return OpenUpwardsPageTransitionsBuilder().buildTransitions(
                      MaterialPageRoute(
                        builder: (context) => ChatRoomPageSetup(
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

               */
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
