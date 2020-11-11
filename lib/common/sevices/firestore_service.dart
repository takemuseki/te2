import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;

  //自動生成の名前を利用してdocumentを作成する
  //作成後はdocumentIdを返す。もしくはエラーを返す。
  Future<String> addDocument({
    @required String collectionName,
    @required Map<String, dynamic> map,
  }) async {
    CollectionReference _collectionReference =
        fireStoreInstance.collection(collectionName);
    return await _collectionReference
        .add(map)
        .then((value) => value.id)
        .catchError((e) => e);
  }

  Future<String> addDocument2({
    @required CollectionReference collectionReference,
    @required Map<String, dynamic> map,
  }) async {
    return await collectionReference
        .add(map)
        .then((value) => value.id)
        .catchError((e) => e);
  }

  //存在していなければ"null"
  //存在していればdataを返す。
  Future<dynamic> checkDocumentExistence({
    @required String collectionName,
    @required String documentName,
  }) async {
    final DocumentReference documentReference =
        fireStoreInstance.collection(collectionName).doc(documentName);
    DocumentSnapshot documentSnapshot = await documentReference.get();
    if (documentSnapshot.data() == null) {
      return "null";
    } else {
      return documentSnapshot.data();
    }
  }

  //collectionNameを元に、CollectionReferenceを返す。
  CollectionReference collectionReference({
    @required String collectionName,
  }) {
    return fireStoreInstance.collection(collectionName);
  }

  //指定したdocument内の指定したkeyのfieldを削除する
  Future<void> deleteField({
    @required String collectionName,
    @required String documentName,
    @required String fieldName,
  }) async {
    DocumentReference documentReference =
        fireStoreInstance.collection(collectionName).doc(documentName);
    return await documentReference.update({fieldName: FieldValue.delete()});
  }

  //collectionReference内documentNameに該当するDocumentReferenceを返す。
  DocumentReference documentReference({
    @required CollectionReference collectionReference,
    @required String documentName,
  }) {
    return collectionReference.doc(documentName);
  }

  //collectionNameとdocumentNameから該当のdocumentReferenceを返す。
  DocumentReference documentReference2({
    @required String collectionName,
    @required String documentName,
  }) {
    return fireStoreInstance.collection(collectionName).doc(documentName);
  }

  //documentSnapshotをreturnする。
  Future<DocumentSnapshot> getDocument({
    @required String collectionName,
    @required String documentName,
  }) async {
    final DocumentReference documentReference =
        fireStoreInstance.collection(collectionName).doc(documentName);
    return await documentReference.get();
  }

  Future<DocumentSnapshot> getDocument2({
    @required DocumentReference documentReference,
  }) async {
    return await documentReference.get();
  }

  //指定した名前のDocumentを作成する。
  //まだdocumentが作成されていないときに使用する。
  Future<void> makeDocument({
    @required String collectionName,
    @required String documentName,
    @required Map<String, dynamic> map,
  }) async {
    final CollectionReference _collectionReference =
        fireStoreInstance.collection(collectionName);
    return await _collectionReference.doc(documentName).set(map);
  }

  //documentReferenceをfieldMapでupdateする。
  //documentがすでにある時に使用する。
  Future<void> updateDocument({
    @required String collectionName,
    @required String documentName,
    @required Map fieldMap,
  }) async {
    print("updateDocument firestoreservice");
    final DocumentReference documentReference =
        fireStoreInstance.collection(collectionName).doc(documentName);
    print(documentReference);
    return await documentReference.update(fieldMap);
  }
}
