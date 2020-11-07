import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/items/items.dart';
import 'package:te2/common/sevices/auth_service.dart';
import 'package:te2/common/sevices/firestore_service.dart';

class AuthModel {
  final AuthService authService;
  final FirestoreService firestoreService;
  AuthModel({
    @required this.authService,
    @required this.firestoreService,
  });

  //deleteAuthする。
  //trueかerrorか返す。
  Future<dynamic> deleteAuth() async {
    try {
      await authService.deleteAuth();
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  //成功ならtrue。
  Future<dynamic> signIn({
    @required String email,
    @required String password,
  }) async {
    print("auth model sign in");
    try {
      await authService.singIn(
        email: email,
        password: password,
      );
      print("singInに成功しました");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return "userNotFound";
      } else if (e.code == "wrong-password") {
        return "wrongPassword";
      } else {
        return "failureSignIn";
      }
    } catch (e) {
      print(e);
      return "failureSignIn";
    }
  }

  //signOutする。
  //trueかerrorか返す。
  Future<dynamic> signOut() async {
    try {
      await authService.signOut();
      return true;
    } catch (e) {
      print(e);
      return e;
    }
  }

  //Authに登録する。
  //CollectionReference"Users"にuidをdocumentNameとして情報を登録する。
  //成功ならtrue。
  Future<dynamic> signUp({
    @required String email,
    @required String password,
    @required String userName,
  }) async {
    try {
      print("auth model sign up");
      var result = await authService.signUp(
        email: email,
        password: password,
      );
      print("1");
      //"Users"Collectionに、uidをドキュメント名としたuserMapを追加する。
      if (result is UserCredential) {
        final uid = result.user.uid;
        print("2");
        final Map<String, dynamic> userMap = UserMap(
          uid: uid,
          userName: userName,
          userId: "",
          first: true,
          image: "",
          yourWords: "",
        ).userMap();
        await firestoreService.makeDocument(
          collectionName: "Users",
          documentName: userMap["uid"],
          map: userMap,
        );

        final Map<String, dynamic> _emptyMap = Map<String, dynamic>();
        await firestoreService.makeDocument(
            collectionName: "Requests", documentName: uid, map: _emptyMap);
        await firestoreService.makeDocument(
            collectionName: "Friends", documentName: uid, map: _emptyMap);
        await firestoreService.makeDocument(
            collectionName: "My Cards", documentName: uid, map: _emptyMap);
        await firestoreService.makeDocument(
            collectionName: "Chats", documentName: uid, map: _emptyMap);
        await firestoreService.makeDocument(
            collectionName: "Follows", documentName: uid, map: _emptyMap);
        await firestoreService.makeDocument(
            collectionName: "Followers", documentName: uid, map: _emptyMap);
        print("SignUp完了！");
        return true;
      } else {
        return "予期せぬエラーが発生しました";
      }
    } on FirebaseAuthException catch (e) {
      print("5");
      if (e.code == "weak-password") {
        return "weakPassword";
      } else if (e.code == "email-already-in-use") {
        return "emailAlready";
      } else {
        return "authError";
      }
    } catch (e) {
      //こっちの場合、エラーはfirestoreへの登録失敗だと思われる。
      print(e);
      return "firestoreError";
    }
  }

  String uid() {
    return authService.uid();
  }

  Stream<User> userStream() {
    return authService.userStream();
  }
}
