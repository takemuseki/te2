import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FireStorageService {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  //指定したstorageReferenceのFileを削除する。
  Future<void> deleteFile({
    @required StorageReference storageReference,
  }) async {
    return await storageReference.delete();
  }

  //StorageTaskSnapshotからDownLoadUrlを得る。
  Future<String> fileDownloadUrl({
    @required StorageTaskSnapshot storageTaskSnapshot,
  }) async {
    return await storageTaskSnapshot.ref.getDownloadURL();
  }

  //urlからstorageReferenceを作成する
  Future<StorageReference> getStorageReference({
    @required String url,
  }) async {
    final StorageReference storageReference =
        await firebaseStorage.getReferenceFromUrl(url);
    return storageReference;
  }

  //fileNameを名前としたStorageReferenceを作成する。
  StorageReference makeStorageReference({
    @required String fileName,
  }) {
    return firebaseStorage.ref().child(fileName);
  }

  //FileをuploadしてStorageTaskSnapshotを返す。
  Future<StorageTaskSnapshot> uploadTheFile({
    @required File uploadFile,
    @required StorageReference storageReference,
  }) async {
    StorageUploadTask storageUploadTask = storageReference.putFile(uploadFile);
    StorageTaskSnapshot storageTaskSnapshot =
        await storageUploadTask.onComplete;
    return storageTaskSnapshot;
  }

  //Fileをuploadして、FileをDownloadするUrlを取得する。
  Future<dynamic> uploadFileDownloadUrl({
    @required String fileName,
    @required File uploadFile,
  }) async {
    final StorageReference _storageReference = makeStorageReference(
      fileName: fileName,
    );
    final StorageTaskSnapshot _storageTaskSnapshot = await uploadTheFile(
      uploadFile: uploadFile,
      storageReference: _storageReference,
    );
    return await fileDownloadUrl(
      storageTaskSnapshot: _storageTaskSnapshot,
    );
  }
}
