import 'package:master/helpers/local_helper.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Language {
  static change(String code) async {
    await LocalHelper.setLang(code);
    Get.updateLocale(lang(code));
    return true;
  }

  static lang(String code) {
    var _code = code.split("_");
    return Locale(_code[0], _code[1]);
  }
}
