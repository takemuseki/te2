import 'package:flutter/material.dart';

class SignPage {
  Widget signInPage({
    @required Widget label,
    @required Widget emailInput,
    @required Widget passwordInput,
    @required Widget toSignUpButton,
    @required Widget signInButton,
  }) {
    return Scaffold(
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                label,
                const SizedBox(
                  height: 24.0,
                ),
                emailInput,
                const SizedBox(
                  height: 24.0,
                ),
                passwordInput,
                const SizedBox(
                  height: 24.0,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toSignUpButton,
                      signInButton,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpPage({
    @required Widget label,
    @required Widget emailInput,
    @required Widget passwordInput,
    @required Widget userNameInput,
    @required Widget toSignInButton,
    @required Widget signUpButton,
  }) {
    return Scaffold(
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                label,
                const SizedBox(
                  height: 24.0,
                ),
                emailInput,
                const SizedBox(
                  height: 24.0,
                ),
                passwordInput,
                const SizedBox(
                  height: 24.0,
                ),
                userNameInput,
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      toSignInButton,
                      signUpButton,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
