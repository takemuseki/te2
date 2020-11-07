import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final Widget form;
  PostPage({
    @required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        form,
      ],
    );
  }
}
