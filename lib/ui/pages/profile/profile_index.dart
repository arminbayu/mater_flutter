import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master/func/change_language.dart';
import 'package:master/shared/theme.dart';
import 'package:master/translate/_index.dart';
import 'package:master/ui/widgets/custom_button.dart';
import 'package:master/ui/widgets/custom_container.dart';
import 'package:master/ui/widgets/custom_items_select.dart';
import 'package:master/ui/widgets/profile_container_items.dart';
import 'package:master/ui/widgets/profile_item.dart';

import 'page_theme.dart';
import 'profile_header.dart';

class ProfileIndex extends StatefulWidget {
  @override
  _ProfileIndexState createState() => _ProfileIndexState();
}

bool isLoading = true;
String _language = 'en_US';
String languageText = 'English';

String fp = "";
String fullname = "";

class _ProfileIndexState extends State<ProfileIndex> {
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    _startUp();
    super.initState();
  }

  _startUp() async {
    setState(() {
      _language = 'en_US';
      languageText = 'English';
      fullname = 'example';
      fp = 'FP123456';
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      isHeader: false,
      isScrollView: false,
      isLoading: isLoading,
      child: PageTheme(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 20),
              child: ProfileHeader(fullname: fullname, fp: fp),
            ),
            ProfileContainerItems(
              title: "settings".tr,
              maxHeight: Get.height - 450,
              children: [
                ProfileItem(
                  title: 'change_language'.tr,
                  subTitle: languageText,
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomItemsSelect(
                          height: 175,
                          items: Lang().list_items,
                          selected: _language,
                        );
                      },
                    ).then(
                      (val) => (val != null)
                          ? changeLanguage(val['value'] ?? "")
                          : null,
                    );
                  },
                ),
                Divider(color: greyBorderColor),
                ProfileItem(
                  title: 'bank'.tr,
                  subTitle: "bank_account".tr,
                  onTap: () => print("PINDAH HALAMAN"),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 100),
              child: CustomButton(
                onPressed: () {},
                margin: EdgeInsets.symmetric(horizontal: 50),
                onText: Text("sign_out".tr),
                onRadius: 50,
                isActive: true,
                btnColor: iconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeLanguage(String value) {
    setState(() {
      isLoading = true;
    });
    var duration = const Duration(milliseconds: 750);
    return Timer(duration, () async {
      bool res = await Language.change(value);
      if (res) {
        var lang = Lang().list_lang;
        setState(() {
          _language = value;
          languageText = lang[value];
          isLoading = false;
        });
      }
    });
  }
}
