import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:te2/common/sevices/firestorage_service.dart';
import 'package:te2/common/sevices/firestore_service.dart';
import 'package:te2/common/sevices/image_selector_service.dart';
import 'package:te2/utils/file_name.dart';

class OneselfModel {
  final FirestoreService firestoreService;
  final FireStorageService fireStorageService;
  final ImageSelectorService imageSelectorService;
  final String uid;
  String downloadUrlTemp = "";

  OneselfModel({
    @required this.firestoreService,
    @required this.fireStorageService,
    @required this.imageSelectorService,
    @required this.uid,
  });

  //uidを渡し、uidと時間を合わせてfileのtitleを生成する。
  //生成したtitleおよび選択したfileから、fileをstorageに保存し、
  //download可能なurlを取得する。
  //downloadUrlはerrorもしくはexceptionの場合、そのまま返る。
  //fileが選択されなかった場足nullが返る。
  //この関数内で何かしらのエラーが生じた場合エラーが返る。
  Future<dynamic> uploadUserImage() async {
    try {
      File uploadFile = await imageSelectorService.getPickGalleryImage();
      final fileName = fileNameMilliseconds(
        fileName: uid,
      );
      if (uploadFile != null) {
        final String downloadUrl =
            await fireStorageService.uploadFileDownloadUrl(
          fileName: fileName,
          uploadFile: uploadFile,
        );
        downloadUrlTemp = downloadUrl;
        return true;
      } else {
        return "null";
      }
    } catch (e) {
      return e;
    }
  }

  Future<QuerySnapshot> getCardMap() async {
    print("model getCardMap");
    try {
      final DocumentReference documentReference =
          firestoreService.documentReference2(
        collectionName: "My Cards",
        documentName: uid,
      );
      final CollectionReference collectionReference =
          documentReference.collection("cards");
      return await collectionReference.orderBy("timestamp").limit(10).get();
    } catch (e) {
      print("e");
      print(e);
      return e;
    }
  }

  void emptyTheUrl() {
    downloadUrlTemp = "";
  }
}
