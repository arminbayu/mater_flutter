import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  Header({
    this.isNewNotif = false,
  });

  bool isNewNotif;
  static double? screenWidth;
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    screenWidth = Get.width / 2.5;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image(
                  image: AssetImage("assets/images/fasapay_logo.png"),
                  width: screenWidth,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/notifikasi");
                  },
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.notifications_outlined,
                        color: Colors.grey,
                        size: 35.0,
                      ),
                      (isNewNotif)
                          ? new Positioned(
                              right: 0,
                              child: new Container(
                                padding: EdgeInsets.all(2),
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 15,
                                  minHeight: 15,
                                ),
                                child: Text(
                                  '!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : new Container()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
