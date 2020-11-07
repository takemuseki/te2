import 'package:flutter/material.dart';

class HomePage {
  Widget page({
    @required Widget child,
    @required BottomNavigationBar bottomNavigationBar,
  }) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
