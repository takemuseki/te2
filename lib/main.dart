import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:te2/common/sevices/auth_service.dart';
import 'package:te2/common/sevices/firestorage_service.dart';
import 'package:te2/common/sevices/firestore_service.dart';
import 'package:te2/common/sevices/image_selector_service.dart';
import 'package:te2/process/1_auth_process/auth_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, //縦固定
  ]);
  print("main1");
  await Firebase.initializeApp();
  print("main2");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      lazy: false,
      create: (context) => MyAppModel(),
      builder: (context, child) {
        return AuthSetup();
      },
    );
  }
}

class MyAppModel {
  final FirestoreService firestoreService = FirestoreService();
  final FireStorageService fireStorageService = FireStorageService();
  final AuthService authService = AuthService();
  final ImageSelectorService imageSelectorService = ImageSelectorService();
}
