import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:te2/common/sevices/firestorage_service.dart';
import 'package:te2/common/sevices/firestore_service.dart';
import 'package:te2/common/sevices/image_selector_service.dart';
import 'package:te2/utils/file_name.dart';

class MaterialAppModel extends ChangeNotifier {
  final FirestoreService firestoreService;
  final FireStorageService fireStorageService;
  final ImageSelectorService imageSelectorService;
  final String uid;
  final Map<String, dynamic> oneselfInfoMap;
  String downloadUrlTemp = "";
  MaterialAppModel({
    @required this.firestoreService,
    @required this.fireStorageService,
    @required this.imageSelectorService,
    @required this.uid,
    @required this.oneselfInfoMap,
  });
  Map<String, dynamic> followersUidMap;
  Map<String, dynamic> followsUidMap;
  Map<String, dynamic> oneselfCardsMap;

  Future<void> updateOneselfInfoMap({
    @required Map<String, dynamic> map,
  }) async {
    try {
      print("updateOneselfInfoMap");
      if (downloadUrlTemp.isNotEmpty) {
        Map<String, dynamic> urlMap = {"image": downloadUrlTemp};
        map.addAll(urlMap);
        downloadUrlTemp = "";
      }
      print(map);
      await firestoreService.updateDocument(
        collectionName: "Users",
        documentName: uid,
        fieldMap: map,
      );
      DocumentSnapshot updateMap = await firestoreService.getDocument(
          collectionName: "Users", documentName: uid);
      oneselfInfoMap.addAll(updateMap.data());
      print(oneselfInfoMap);
      notifyListeners();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<void> updateOneselfCardMap(
      {@required Map<String, dynamic> map}) async {
    try {
      print("updateOneselfInfoMap");
      await firestoreService.updateDocument(
        collectionName: "Users",
        documentName: uid,
        fieldMap: map,
      );
      print("updateOneselfInfoMap2");
      DocumentSnapshot updateMap = await firestoreService.getDocument(
          collectionName: "Users", documentName: uid);
      print("updateOneselfInfoMap3");
      print(updateMap);
      print(oneselfInfoMap);
      oneselfInfoMap.addAll(updateMap.data());
      print(oneselfInfoMap);
      notifyListeners();
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> selectImage() async {
    try {
      File uploadFile = await imageSelectorService.getPickGalleryImage();
      final fileName = fileNameMilliseconds(
        fileName: uid,
      );
      if (uploadFile != null) {
        Map<String, File> imageMap = {fileName: uploadFile};
        return imageMap;
      } else {
        return "null";
      }
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> uploadUserImage({
    @required Map<String, File> imageMap,
  }) async {
    try {
      String fileName;
      File uploadFile;
      for (String key in imageMap.keys) {
        fileName = key;
        uploadFile = imageMap[key];
      }
      final String downloadUrl = await fireStorageService.uploadFileDownloadUrl(
        fileName: fileName,
        uploadFile: uploadFile,
      );
      downloadUrlTemp = downloadUrl;
      Map<String, dynamic> map = {};
      updateOneselfInfoMap(map: map);
      return true;
    } catch (e) {
      return e;
    }
  }

  Future<Map<String, dynamic>> newFollowersUidMap() async {
    try {
      print("newFollowersUidMap");

      DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
          collectionName: "Followers", documentName: uid);
      Map<String, dynamic> map = documentSnapshot.data();
      followersUidMap = map;
      print("newFollowersUidMap end");

      return followersUidMap;
    } catch (e) {
      print(e);
      print("newFollowersUidMap end");

      return e;
    }
  }

  Future<Map<String, dynamic>> newFollowsUidMap() async {
    print("newFollowsUidMap");
    DocumentSnapshot documentSnapshot = await firestoreService.getDocument(
        collectionName: "Follows", documentName: uid);
    Map<String, dynamic> map = documentSnapshot.data();
    followsUidMap = map;
    print(followsUidMap);
    print("newFollowsUidMap end");
    return followsUidMap;
  }
}
