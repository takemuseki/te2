import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  //todo verifyするための機能を実装する
  //todo email以外の方法でのサインアップ、ログインを実装する

  Future<UserCredential> signUp({
    @required String email,
    @required String password,
  }) async {
    UserCredential userCredential =
        await authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Stream<User> userStream() {
    return authInstance.authStateChanges();
  }

  Future<UserCredential> singIn({
    @required String email,
    @required String password,
  }) async {
    UserCredential userCredential =
        await authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<void> signOut() async {
    return await authInstance.signOut();
  }

  Future<void> deleteAuth() async {
    return await authInstance.currentUser.delete();
  }

  String uid() {
    return authInstance.currentUser.uid;
  }
}
