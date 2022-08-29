import 'package:master/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  static double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = Get.width / 5;
    var nama = "Example";
    var status = "Verifikasi";
    var fp = "FP123456".replaceAll('FP', '');

    return Container(
      margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome".tr,
              style: greyBoldFontStyle12,
            ),
            Text(
              nama,
              style: blackBoldFontStyle18,
            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.green,
                      size: 12.0,
                    ),
                    Text(
                      status,
                      style: greenBoldFontStyle12,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('FP', style: orangeBoldFontStyle12),
                    Text(
                      fp,
                      style: blackBoldFontStyle12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
