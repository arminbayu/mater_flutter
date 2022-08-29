import 'package:master/func/format_currency.dart';
import 'package:master/ui/widgets/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:master/shared/theme.dart';

class BalanceInfo extends StatelessWidget {
  static double? screenWidth;
  static double? screenHeight;
  BalanceInfo({
    required this.balance,
  });

  String? balance;
  static const IconData paperplane = IconData(0xf733);

  @override
  Widget build(BuildContext context) {
    screenWidth = Get.width / 5;
    screenHeight = Get.height / 10;
    Widget textBalance_1 = Text("0");
    Widget textBalance_2 = Text("0");

    if (balance == "") {
      balance = '0';
    } else {
      String string = FormatCurrency.currency("USD", balance!);
      final splitted = string.split('.');
      textBalance_1 = Text(
        splitted[0],
        style: blackBoldFontStyle28,
      );
      textBalance_2 = Container(
        padding: EdgeInsets.only(bottom: 3),
        child: Text(
          "." + splitted[1],
          style: blackFontStyle14,
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: [Color(0xFFD5EBF6), Colors.white],
            tileMode: TileMode.mirror,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("balance".tr, style: blackFontStyle14),
                  Divider(
                    height: 5,
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        new String.fromCharCodes(new Runes('\u0024')) + " ",
                        style: blackFontStyle30,
                      ),
                      textBalance_1,
                      textBalance_2,
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              color: Colors.transparent,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buttonMenu("topup".tr, FontAwesomeIcons.plus, "/topup",
                      false, context),
                  _buttonMenu("transfer".tr, FontAwesomeIcons.paperPlane,
                      "/transfer", false, context),
                  _buttonMenu(
                      "withdraw".tr,
                      FontAwesomeIcons.arrowRightFromBracket,
                      "/withdraw",
                      true,
                      context),
                  _buttonMenu("history".tr, FontAwesomeIcons.history,
                      "/history", false, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buttonMenu(String text, IconData icon, String page, bool isRotate,
      BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('PINDAH HALAMAN');
        // bool nextPage = false;
        // if (page == "/transfer" && user["status"] != "Registered")
        //   nextPage = true;
        // if (page == "/topup" && user["status"] != "Registered") nextPage = true;
        // if (page == "/withdraw" && user["status"] != "Registered")
        //   nextPage = true;
        // if (page == "/history") nextPage = true;

        // if (nextPage) {
        //   Get.toNamed(page, arguments: user);
        // } else {
        //   _showDialog(context);
        // }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Transform.rotate(
              angle: (isRotate) ? 90 * 3.14 / 180 : 0,
              child: Icon(
                icon,
                size: 25,
                color: iconColor,
              ),
            ),
          ),
          Text(text, style: blackFontStyle12),
        ],
      ),
    );
  }
}

_showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlert(
            onPressedTrue: () {},
            onPressedFalse: () {
              Navigator.pop(context, false);
            },
            Title: "title_alert".tr,
            Message: 'message_info_status_register'.tr,
            isTwoButton: false);
      });
}
