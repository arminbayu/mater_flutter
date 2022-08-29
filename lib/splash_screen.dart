import 'dart:io';

import 'package:master/config/index.dart';
import 'package:master/func/change_language.dart';
import 'package:master/helpers/local_helper.dart';

import 'package:master/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  static String tag = 'splash-screen';
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String message = "";
  bool isExist = false;
  bool isConect = false;

  @override
  void initState() {
    super.initState();
    _connection();
  }

  Future _connection() async {
    try {
      final result = await InternetAddress.lookup(url);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() => isConect = true);
        _start();
      }
    } on SocketException catch (e) {
      setState(() => isConect = false);
    }
  }

  _start() async {
    try {
      final result = await InternetAddress.lookup(url);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var statusLang = await LocalHelper.statusLang();
        if (!statusLang) {
          await LocalHelper.setLang("en_US");
        }
        var lang = await LocalHelper.getLang();
        Language.change(lang);

        setState(() => message = "Please wait...");
        Future.delayed(Duration(milliseconds: 1000), () => _redirectToPage());
      } else {
        setState(() => isConect = false);
      }
    } on SocketException catch (e) {
      setState(() => isConect = false);
    }
  }

  _redirectToPage() async {
    Get.offAndToNamed("/slider");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            // colors: [Colors.orange, Colors.white, Colors.blue],
            colors: [Colors.white, Colors.white, Colors.white],
            tileMode: TileMode.mirror,
          ),
        ),
        child: conten(),
      ),
    );
  }

  conten() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          color: Colors.transparent,
          height: 10,
        ),
        Image.asset("assets/images/fasapay_logo.png", height: 50),
        (isConect)
            ? Column(
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(
                      color: blueDefaultColor,
                    ),
                    height: 30.0,
                    width: 30.0,
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 10,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        color: blueDefaultColor, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 50,
                  ),
                ],
              )
            : Container(
                width: Get.width,
                height: 30,
                color: Colors.red,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Please check your connection",
                    style: whiteBoldFontStyle14,
                  ),
                ),
              ),
      ],
    );
  }
}
