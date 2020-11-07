import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class SignParts {
  final BuildContext context;
  SignParts({
    @required this.context,
  });

  Future<Dialog> authErrorDialog() {
    final title = Text("Sign up に失敗しました");
    final contents = Text("ユーザー作成に失敗しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Widget toSignInButton({
    @required VoidCallback changeSignInUp,
  }) {
    return RaisedButton(
      child: Text("Sign In に切り替え"),
      color: Theme.of(context).accentColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: changeSignInUp,
    );
  }

  Widget toSignUpButton({
    @required VoidCallback changeSignInUp,
  }) {
    return RaisedButton(
      child: Text("Sign Up に切り替え"),
      color: Theme.of(context).accentColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      onPressed: changeSignInUp,
    );
  }

  Future<Dialog> emailAlreadyDialog() {
    final title = Text("Sign up に失敗しました");
    final contents = Text("既に使われているメールアドレスです");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Widget emailInput({
    @required TextEditingController emailInputController,
  }) {
    return Card(
      child: TextFormField(
        controller: emailInputController,
        decoration: const InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "Email",
          hintText: "Emailを入力してください",
        ),
      ),
    );
  }

  Future<Dialog> emptySignInDialog() {
    print("emptyDialog");
    final title = Text("入力がありません");
    final contents = Text("Email, Passwords を入力してください");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Future<Dialog> emptySignUpDialog() {
    print("emptyDialog");
    final title = Text("入力がありません");
    final contents = Text("Email, Passwords, UserName をすべて入力してください");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Future<Dialog> firestoreErrorDialog() {
    final title = Text("Sign up に失敗しました");
    final contents = Text("ユーザー情報の登録に失敗しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Future<Dialog> failureSignInDialog() {
    final title = Text("Sign in に失敗しました");
    final content = Text("予期せぬエラーが発生しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Widget signInButton({
    @required VoidCallback signIn,
  }) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.greenAccent,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: signIn,
      ),
    );
  }

  Widget signUpButton({
    @required VoidCallback signUp,
  }) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.greenAccent,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: signUp,
      ),
    );
  }

  Widget signInLabel() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Sign In",
        style: TextStyle(
          fontSize: 36,
        ),
      ),
    );
  }

  Widget signUpLabel() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "Sign Up",
        style: TextStyle(
          fontSize: 36,
        ),
      ),
    );
  }

  Widget passwordInput({
    @required TextEditingController passwordInputController,
  }) {
    return Card(
      child: TextFormField(
        controller: passwordInputController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "Password",
          hintText: "Passwordを入力してください",
        ),
      ),
    );
  }

  Future<Dialog> successSignInDialog() {
    final title = Text("成功");
    final content = Text("Sign In しました");

    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Future<Dialog> successSignUpDialog() {
    final title = Text("成功");
    final content = Text("Sign Up しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Widget userNameInput({
    @required TextEditingController userNameInputController,
  }) {
    return Card(
      child: TextFormField(
        controller: userNameInputController,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: "UserName",
          hintText: "UserNameを入力してください",
        ),
      ),
    );
  }

  Future<Dialog> userNotFoundDialog() {
    final title = Text("Sign in に失敗しました");
    final content = Text("登録されていないメールアドレスです");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }

  Future<Dialog> weakPasswordDialog() {
    final title = Text("Sign up に失敗しました");
    final contents = Text("パスワードが脆弱です");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }

  Future<Dialog> wrongPasswordDialog() {
    final title = Text("Sign in に失敗しました");
    final content = Text("パスワードが間違っています");
    return simpleDialog(
      titleWidget: title,
      contentWidget: content,
      context: context,
    );
  }
}
