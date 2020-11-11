import 'package:flutter/material.dart';
import 'package:te2/utils/dialog.dart';

class PostParts {
  final BuildContext context;
  PostParts({
    @required this.context,
  });
  Widget postButton({
    @required VoidCallback post,
  }) {
    return FlatButton(
      child: Text("submit"),
      onPressed: post,
    );
  }

  Widget postForm({
    @required Widget textFormField,
    @required Widget postButton,
  }) {
    return Form(
      child: Column(
        children: [
          textFormField,
          postButton,
        ],
      ),
    );
  }

  Widget textFormField({
    @required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      maxLength: 200,
      autofocus: true,
      autocorrect: true,
    );
  }

  Future<Dialog> postFailureDialog({
    @required BuildContext context,
  }) {
    final Text title = Text("エラー");
    final Text contents = Text("カードの追加に失敗しました");
    return simpleDialog(
      titleWidget: title,
      contentWidget: contents,
      context: context,
    );
  }
}
