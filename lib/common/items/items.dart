import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//urlと名前を保持するためのクラス。storageに保存する際に使用。
class ImageFireStorageResult {
  final String imageUrl;
  final String imageFileName;

  ImageFireStorageResult({this.imageUrl, this.imageFileName});
}

//Userの基本データを保持するためのクラス。
//.userMapでMap<String,dynamic>を返せるので、firebaseに保存する時に利用する。
//通常に呼び出したいだけなら.uid etc)で使える。
class UserMap {
  final String uid;
  final String userId;
  final bool first;
  final String userName;
  final String image;
  final String yourWords;
  UserMap({
    @required this.uid,
    @required this.userName,
    @required this.userId,
    @required this.first,
    @required this.image,
    @required this.yourWords,
  });

  Map<String, dynamic> userMap() {
    Map<String, dynamic> tmp = {
      "uid": uid,
      "user id": userId,
      "first": first,
      "user name": userName,
      "image": image,
      "your words": yourWords,
    };

    return tmp;
  }
}

//AccountPageに遷移する際にsetupに渡す。
// [表示したいAccountをAとする]
//accountMapにAの情報を入れる。
//followMapに自分のがfollowしてる人のMapを入れる。
//.followBooleanでAをfollowしているかしていないかを判別できる。
class AccountInformation {
  final Map<String, dynamic> accountMap;
  final Map<String, dynamic> followMap;
  AccountInformation({
    @required this.accountMap,
    @required this.followMap,
  });
  bool followBoolean() {
    if (followMap[accountMap["uid"]] == null) {
      return false;
    } else {
      return true;
    }
  }
}


//ChatRoomに画面遷移する時にsetupに渡す。
// [表示したいチャットルームをAとする]
//memberMapにAのmemberの情報を入れる。
//contentMapにAのcontentの情報を入れる。
//chatRoomIdにAのchatRoomIdを入れる。
class ChatRoomInformation {
  final Map<String, dynamic> memberMap;
  final Map<String, dynamic> contentMap;
  final String chatRoomId;
  ChatRoomInformation({
    @required this.memberMap,
    @required this.contentMap,
    @required this.chatRoomId,
  });
}

class CardInfo {
  final String uid;
  final String userName;
  final String userImageUrl;
  final String sentence;
  final int time;
  final Timestamp timestamp;
  final String cardImageUrl;

  CardInfo({
    @required this.uid,
    @required this.userName,
    @required this.userImageUrl,
    @required this.sentence,
    @required this.time,
    @required this.timestamp,
    @required this.cardImageUrl,
  });

  Map<String, dynamic> map() {
    Map<String, dynamic> map = {
      "uid": uid,
      "user name": userName,
      "user image url": userImageUrl,
      "sentence": sentence,
      "time": time,
      "timestamp": timestamp,
      "card image url": cardImageUrl,
    };
    return map;
  }
}
