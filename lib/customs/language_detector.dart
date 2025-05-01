import 'dart:ui';

import 'package:flutter/material.dart';

class LanguageDetector {
  static TextDirection detectLanguage({required String text}) {
    bool isArabic = false;
    if (text.isNotEmpty) {
      isArabic = (RegExp(r'^[\u0600-\u06FF]').hasMatch(text));
    }
    return isArabic ? TextDirection.rtl : TextDirection.ltr;
  }

  static TextAlign detectLanguageAlign({required String text}) {
    bool isArabic = false;
    if (text.isNotEmpty) {
      isArabic = (RegExp(r'^[\u0600-\u06FF]').hasMatch(text));
    }
    return isArabic ? TextAlign.right : TextAlign.left;
  }

  static CrossAxisAlignment detectLanguageCrossAxis({required String text}) {
    bool isArabic = false;
    if (text.isNotEmpty) {
      isArabic = (RegExp(r'^[\u0600-\u06FF]').hasMatch(text));
    }
    return isArabic ? CrossAxisAlignment.start : CrossAxisAlignment.end;
  }

  static bool detectLanguageIsAr({required String text}) {
    bool isArabic = false;
    if (text.isNotEmpty) {
      isArabic = (RegExp(r'^[\u0600-\u06FF]').hasMatch(text));
    }
    return isArabic;
  }
}
