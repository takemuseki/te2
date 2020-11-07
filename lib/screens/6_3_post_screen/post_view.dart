import 'package:flutter/material.dart';
import 'package:te2/screens/6_3_post_screen/post_contents.dart';
import 'package:te2/screens/6_3_post_screen/post_functions.dart';
import 'package:te2/screens/6_3_post_screen/post_page.dart';
import 'package:te2/screens/6_3_post_screen/post_parts.dart';

class PostView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("'PostView");
    final PostParts _parts = PostParts(context: context);
    final PostFunctions _functions = PostFunctions(context: context);
    final PostContents contents = PostContents(
      context: context,
      parts: _parts,
      functions: _functions,
    );

    return PostPage(
      form: contents.form(),
    );
  }
}
