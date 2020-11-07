import 'package:flutter/material.dart';
import 'package:te2/screens/3_first_screen/first_contents.dart';
import 'package:te2/screens/3_first_screen/first_functions.dart';
import 'package:te2/screens/3_first_screen/first_page.dart';
import 'package:te2/screens/3_first_screen/first_parts.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirstParts _parts = FirstParts(context: context);
    FirstFunctions _functions = FirstFunctions(context: context);
    FirstContents contents = FirstContents(
      parts: _parts,
      functions: _functions,
    );
    FirstPage page = FirstPage();

    Widget title = contents.title();
    Widget sentence = contents.sentence();
    Widget inputForm = contents.inputForm();
    Widget submitButton = contents.submitButton();

    return page.page(
      title: title,
      sentence: sentence,
      inputForm: inputForm,
      submitButton: submitButton,
    );
  }
}
