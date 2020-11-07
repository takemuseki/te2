import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String text;
  ErrorPage({
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ErrorPage2(text: text),
    );
  }
}

class ErrorPage2 extends StatelessWidget {
  final String text;

  const ErrorPage2({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
