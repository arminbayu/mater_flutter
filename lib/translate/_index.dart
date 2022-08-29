import 'package:get/get.dart';

import 'package:master/translate/usa.dart';
import 'package:master/translate/indonesia.dart';

class Lang extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': usaLang,
        'id_ID': indonesiaLang,
      };

  Map<String, dynamic> list_lang = {
    'en_US': 'english'.tr,
    'id_ID': 'indonesia'.tr,
  };

  List<dynamic> list_items = [
    {"value": 'en_US', "text": 'english'.tr},
    {"value": 'id_ID', "text": 'indonesia'.tr},
  ];
}
