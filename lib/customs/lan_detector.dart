import 'package:flutter/material.dart';

class LanDetector {
  //@Deprecated('use isArDir(bool)')
  static TextDirection detectDir({required String text}) {
    bool isAr = isItAr(text: text);
    return isArDir(isAr: isAr);
  }

  static TextAlign detectAlign({required String text}) {
    bool isAr = isItAr(text: text);
    return isArAl(isAr: isAr);
  }

  static CrossAxisAlignment detectCrossAl({required String text}) {
    bool isAr = isItAr(text: text);
    return isArCrossAxis(isAr: isAr);
  }

  static TextDirection isArDir({required bool isAr}) {
    return isAr ? TextDirection.rtl : TextDirection.ltr;
  }

  static CrossAxisAlignment isArCrossAxis({required bool isAr}) {
    return isAr ? CrossAxisAlignment.start : CrossAxisAlignment.end;
  }

  static bool isItAr({required String text}) {
    if (text.isNotEmpty) return (RegExp(r'^[\u0600-\u06FF]').hasMatch(text));
    return false;
  }

  static TextAlign isArAl({required bool isAr}) {
    return isAr ? TextAlign.right : TextAlign.left;
  }
}
