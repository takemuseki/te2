import 'package:flutter/material.dart';

//millisecondsを追加したstringを返す。
String fileNameMilliseconds({@required String fileName}) {
  return fileName + DateTime.now().millisecondsSinceEpoch.toString();
}

//JSTでの現在時刻を返す。
//2020-11-02T23:43:56.180の形。

String dateTimeMilliseconds() {
  return DateTime.now().toIso8601String();
}
