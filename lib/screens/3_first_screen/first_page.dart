import 'package:flutter/material.dart';

class FirstPage {
  Widget page({
    @required Widget title,
    @required Widget sentence,
    @required Widget inputForm,
    @required Widget submitButton,
  }) {
    return Scaffold(
      body: Container(
        child: Column(
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
