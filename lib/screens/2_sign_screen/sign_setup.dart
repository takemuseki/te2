import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:te2/screens/2_sign_screen/sign_model.dart';
import 'package:te2/screens/2_sign_screen/sign_view.dart';

class SignSetUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => SignModel(),
        lazy: false,
        builder: (context, child) {
          return SignView();
        },
      ),
    );
  }
}
