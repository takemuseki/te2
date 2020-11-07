import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final String text;
  LoadingPage({
    @required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingPage2(text: text),
    );
  }
}

class LoadingPage2 extends StatelessWidget {
  final String text;
  LoadingPage2({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text,
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
