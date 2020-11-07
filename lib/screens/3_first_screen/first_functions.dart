import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/3_first_screen/first_model.dart';

class FirstFunctions {
  final BuildContext context;
  FirstFunctions({
    @required this.context,
  });

  Future<dynamic> submitUserId({
    @required TextEditingController userIdInputController,
  }) {
    print("submitUserIdが呼び出されました");
    return context.read<FirstModel>().addUserId(
          userId: userIdInputController.text,
        );
  }

  Future<void> getUserMap() {
    return context.read<FirstModel>().getUserMap();
  }
}
