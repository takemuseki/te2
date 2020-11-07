import 'package:flutter/material.dart';

class SignModel extends ChangeNotifier {
  int index = 0;

  void toSignIn() {
    print("model to SignIn");
    index = 0;
    notifyListeners();
  }

  void toSignUp() {
    print("model toSignUp");
    index = 1;
    notifyListeners();
  }
}
