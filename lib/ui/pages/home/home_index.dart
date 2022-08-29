import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:master/control/home_control.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:master/ui/pages/profile/profile_index.dart';

import 'package:master/ui/widgets/custom_container.dart';
import 'package:master/ui/widgets/custom_alert.dart';

import 'widget/balance_info.dart';
import 'widget/user_info.dart';
import 'widget/last_transaction.dart';
import 'widget/news.dart';
import 'header.dart';

import 'package:master/shared/theme.dart';

class HomeIndex extends StatefulWidget {
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (_) => CustomAlert(
            onPressedTrue: () {
              SystemNavigator.pop();
            },
            onPressedFalse: () {
              Navigator.pop(context, false);
            },
            Title: "title_alert".tr,
            Message: "message_alert".tr,
            isTwoButton: true,
          ),
        )) ??
        false;
  }

  bool loadData = true;

  @override
  void initState() {
    setState(() => loadData = true);
    super.initState();
    _startUp();
  }

  _startUp() async {
    // var data = await HomeControl.start(context);

    var duration = const Duration(seconds: 2);
    Timer(duration, () {
      setState(() => loadData = false);
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: CustomContainer(
        isHeader: false,
        isScrollView: false,
        isLoading: loadData,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_selectedIndex == 1) ...[
                Expanded(
                  child: ProfileIndex(),
                ),
              ] else ...[
                Header(
                  isNewNotif: true,
                ),
                if (_selectedIndex == 0) ...[
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        UserInfo(),
                        BalanceInfo(balance: "1000"),
                        LastTransaction(listHistory: [
                          {
                            'type': 'topup',
                            'batchnumber': 'TP123564787',
                            'status': 'PENDING',
                            'datetime': '2022-08-02'
                          },
                          {
                            'type': 'topup',
                            'batchnumber': 'TP123456780',
                            'status': 'FINISH',
                            'datetime': '2022-07-20'
                          },
                        ], image: 'assets/images/notransactionimage.png'),
                        News(),
                      ],
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
        floatingButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: (_selectedIndex == 2) ? mainColor : iconColor,
          onPressed: () {
            // _onItemTapped(2);
            print("QR CODE");
          },
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(FontAwesomeIcons.qrcode, size: 30),
            ),
          ),
        ),
        isCenterFloatingButton: true,
        bottomChild: BottomAppBar(
          notchMargin: 8,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(0),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          child: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: _buildIcon(FontAwesomeIcons.house, 'home'.tr, 0),
                ),
                Expanded(flex: 2, child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: _buildIcon(FontAwesomeIcons.userLarge, 'profil'.tr, 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getItemColor(int index) =>
      _selectedIndex == index ? mainColor : Colors.grey;

  Widget _buildIcon(IconData iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Color(0xFFe0e0e0),
            ),
          ),
        ),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData, color: _getItemColor(index)),
              SizedBox(height: 2),
              Text(text,
                  style: TextStyle(fontSize: 12, color: _getItemColor(index))),
            ],
          ),
          onTap: () => _onItemTapped(index),
        ),
      );
}
