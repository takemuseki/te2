import 'package:flutter/material.dart';
import 'package:te2/screens/2_sign_screen/sign_contents.dart';
import 'package:te2/screens/2_sign_screen/sign_functions.dart';
import 'package:te2/screens/2_sign_screen/sign_page.dart';
import 'package:te2/screens/2_sign_screen/sign_parts.dart';

class SignView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignParts _parts = SignParts(context: context);
    final SignFunctions _functions = SignFunctions(context: context);
    final SignContents _contents =
        SignContents(functions: _functions, parts: _parts, context: context);
    final SignPage _page = SignPage();

    if (_functions.index() == 0) {
      return _page.signInPage(
        label: _contents.signInLabel(),
        emailInput: _contents.emailInput(),
        passwordInput: _contents.passwordInput(),
        toSignUpButton: _contents.toSignUpButton(),
        signInButton: _contents.signInButton(),
      );
    } else {
      return _page.signUpPage(
        label: _contents.signUpLabel(),
        emailInput: _contents.emailInput(),
        passwordInput: _contents.passwordInput(),
        userNameInput: _contents.userNameInput(),
        toSignInButton: _contents.toSignInButton(),
        signUpButton: _contents.signUpButton(),
      );
    }
  }
}
