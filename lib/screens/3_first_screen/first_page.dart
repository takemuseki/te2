import 'package:flutter/material.dart';

class FirstPage {
  Widget page({
    @required Widget title,
    @required Widget sentence,
    @required Widget inputForm,
    @required Widget submitButton,
  }) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title,
            sentence,
            inputForm,
            submitButton,
          ],
        ),
      ),
    );
  }
}
