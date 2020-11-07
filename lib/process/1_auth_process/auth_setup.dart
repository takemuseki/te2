import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/main.dart';
import 'package:te2/process/1_auth_process/auth_model.dart';
import 'package:te2/screens/2_sign_screen/sign_setup.dart';
import 'package:te2/screens/3_first_screen/first_setup.dart';
import 'package:te2/utils/error_page.dart';
import 'package:te2/utils/loading_page.dart';

class AuthSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthModel>(
      lazy: false,
      create: (context) {
        print("'AuthSetup");
        return AuthModel(
          authService: context.read<MyAppModel>().authService,
          firestoreService: context.read<MyAppModel>().firestoreService,
        );
      },
      builder: (context, child) {
        return AuthProcess2();
      },
    );
  }
}

class AuthProcess2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("'WrapperSetUp");
    return StreamBuilder(
      stream: context.watch<AuthModel>().userStream(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return ErrorPage(
            text: "Streamingに失敗しました。",
          );
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            print("Stream none");
            return LoadingPage(
              text: "Stream none",
            );
          case ConnectionState.waiting:
            print("Stream waiting");
            return LoadingPage(
              text: "Stream waiting",
            );
          case ConnectionState.active:
            print("stream active");
            final bool temp = snapshot.hasData;
            if (temp) {
              return FirstSetup();
            } else {
              return SignSetUp();
            }
            break;
          case ConnectionState.done:
            print("stream done");
            return ErrorPage(
              text: "stream done",
            );
        }
        return ErrorPage(
          text: "No Stream",
        );
      },
    );
  }
}
