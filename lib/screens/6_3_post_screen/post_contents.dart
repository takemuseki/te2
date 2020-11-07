import 'package:flutter/material.dart';
import 'package:te2/screens/6_3_post_screen/post_functions.dart';
import 'package:te2/screens/6_3_post_screen/post_parts.dart';
import 'package:te2/utils/dialog.dart';
import 'package:te2/utils/yet.dart';

class PostContents {
  final BuildContext context;
  final PostParts parts;
  final PostFunctions functions;
  final TextEditingController sentenceController = TextEditingController();
  PostContents({
    @required this.context,
    @required this.parts,
    @required this.functions,
  });

  Widget textFormField() {
    return parts.textFormField(
      controller: sentenceController,
    );
  }

  Widget postButton() {
    return parts.postButton(
      post: () async {
        print("postButton");
        print(sentenceController.text);
        dynamic result =
            await functions.addCard(sentenceController: sentenceController);
        if (result == true) {
          functions.changeCurrentIndex();
        } else if (result == "failed to add card to followers") {
          return yetDialog(context: context);
        } else if (result == "failed to add card to users") {
          return parts.postFailureDialog(context: context);
        } else {
          return errorDialog(context: context);
        }
        sentenceController.clear();
      },
    );
  }

  Widget form() {
    return parts.postForm(
      textFormField: textFormField(),
      postButton: postButton(),
    );
  }
}
