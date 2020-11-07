import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/process/1_auth_process/auth_model.dart';
import 'package:te2/screens/2_sign_screen/sign_model.dart';

class SignFunctions {
  final BuildContext context;
  SignFunctions({
    @required this.context,
  });

  int index() {
    print("index が呼び出されました");
    return context.select((SignModel model) => model.index);
  }

  Future<dynamic> modelSignIn({
    @required TextEditingController emailInputController,
    @required TextEditingController passwordInputController,
  }) async {
    if (emailInputController.text.isEmpty ||
        passwordInputController.text.isEmpty) {
      print("empty");
      return "empty";
    }
    print("functions signIn");
    return await context.read<AuthModel>().signIn(
          email: emailInputController.text,
          password: passwordInputController.text,
        );
  }

  Future<dynamic> modelSignUp({
    @required TextEditingController emailInputController,
    @required TextEditingController passwordInputController,
    @required TextEditingController userNameInputController,
  }) async {
    print("viewModel signUp");
    if (emailInputController.text.isEmpty ||
        passwordInputController.text.isEmpty ||
        userNameInputController.text.isEmpty) {
      print("empty");
      return "empty";
    }

    return await context.read<AuthModel>().signUp(
          email: emailInputController.text,
          password: passwordInputController.text,
          userName: userNameInputController.text,
        );
  }

  void toSignUp() {
    print("toSignUp");
    context.read<SignModel>().toSignUp();
  }

  void toSignIn() {
    print("toSignIn");
    context.read<SignModel>().toSignIn();
  }
}
