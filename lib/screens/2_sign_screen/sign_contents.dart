import 'package:flutter/material.dart';
import 'package:te2/screens/2_sign_screen/sign_functions.dart';
import 'package:te2/screens/2_sign_screen/sign_parts.dart';

class SignContents {
  final SignFunctions functions;
  final SignParts parts;
  final BuildContext context;
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController passwordInputController = TextEditingController();
  final TextEditingController userNameInputController = TextEditingController();

  SignContents({
    @required this.functions,
    @required this.parts,
    @required this.context,
  });

  Widget toSignInButton() {
    return parts.toSignInButton(
      changeSignInUp: () {
        functions.toSignIn();
      },
    );
  }

  Widget toSignUpButton() {
    return parts.toSignUpButton(
      changeSignInUp: () {
        functions.toSignUp();
      },
    );
  }

  Widget signInButton() {
    print("signInButton");
    return parts.signInButton(
      signIn: () async {
        print("sign in");
        dynamic _result = await functions.modelSignIn(
          emailInputController: emailInputController,
          passwordInputController: passwordInputController,
        );
        if (_result == "empty") {
          print("empty");
          return parts.emptySignInDialog();
        } else if (_result == true) {
          print(1);
          return parts.successSignInDialog();
        } else if (_result == "userNotFound") {
          print(2);
          return parts.userNotFoundDialog();
        } else if (_result == "wrongPassword") {
          print(3);
          return parts.wrongPasswordDialog();
        } else if (_result == "failureSignIn") {
          print(4);
          return parts.failureSignInDialog();
        } else {
          print("null");
          return null;
        }
      },
    );
  }

  Widget signUpButton() {
    return parts.signUpButton(
      signUp: () async {
        dynamic _result = await functions.modelSignUp(
          emailInputController: emailInputController,
          passwordInputController: passwordInputController,
          userNameInputController: userNameInputController,
        );
        if (_result == "empty") {
          return parts.emptySignUpDialog();
        } else if (_result == true) {
          return null;
        } else if (_result == "weakPassword") {
          return parts.weakPasswordDialog();
        } else if (_result == "emailAlready") {
          return parts.emailAlreadyDialog();
        } else if (_result == "authError") {
          return parts.authErrorDialog();
        } else if (_result == "firestoreError") {
          return parts.firestoreErrorDialog();
        } else {
          print("null");
          return null;
        }
      },
    );
  }

  Widget emailInput() {
    return parts.emailInput(
      emailInputController: emailInputController,
    );
  }

  Widget signInLabel() {
    return parts.signInLabel();
  }

  Widget signUpLabel() {
    return parts.signUpLabel();
  }

  Widget passwordInput() {
    return parts.passwordInput(
      passwordInputController: passwordInputController,
    );
  }

  Widget userNameInput() {
    return parts.userNameInput(
      userNameInputController: userNameInputController,
    );
  }
}
