import 'package:flutter/material.dart';
import 'package:te2/screens/3_first_screen/first_functions.dart';
import 'package:te2/screens/3_first_screen/first_parts.dart';

class FirstContents {
  final FirstParts parts;
  final FirstFunctions functions;
  final TextEditingController userIdInputController = TextEditingController();
  FirstContents({
    @required this.parts,
    @required this.functions,
  });

  Widget title() {
    return parts.title();
  }

  Widget sentence() {
    return parts.sentence();
  }

  Widget inputForm() {
    return parts.inputForm(
      userIdInputController: userIdInputController,
    );
  }

  Widget submitButton() {
    return parts.submitButton(
      submitUserId: () async {
        print("press");
        dynamic result = await functions.submitUserId(
          userIdInputController: userIdInputController,
        );
        print(result);
        print("result");
        if (result == false) {
          print("false");
          return parts.alreadyUsedDialog();
        } else if (result == true) {
          print("true");
          await parts.successSubmitDialog();
          return functions.getUserMap();
        } else {
          print("error");
          return parts.failureSubmitDialog();
        }
      },
    );
  }
}
