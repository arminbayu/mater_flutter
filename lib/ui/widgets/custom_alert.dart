import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master/shared/theme.dart';

class CustomAlert extends StatelessWidget {
  CustomAlert({
    required this.onPressedTrue,
    required this.onPressedFalse,
    required this.Title,
    required this.Message,
    required this.isTwoButton,
    this.buttonString = '',
  });
  final VoidCallback onPressedTrue;
  final VoidCallback onPressedFalse;
  final String Title;
  final String Message;
  final bool isTwoButton;
  final String buttonString;
  @override
  Widget build(BuildContext context) {
    double height = Get.height / 3.5;
    double width = Get.width - 50;
    return Center(
        child: Material(
      color: Colors.transparent,
      child: Container(
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Text(
                    Title,
                    style: whiteBoldFontStyle16,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: new Text(
                    Message,
                    style: blackFontStyle14,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.0),
                    bottomRight: Radius.circular(5.0),
                  ),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  if (isTwoButton) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        child: Text(
                          'no'.tr,
                          style: whiteBoldFontStyle12,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          minimumSize: Size(75, 35),
                        ),
                        onPressed: onPressedFalse,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        child: Text(
                          'yes'.tr,
                          style: whiteBoldFontStyle12,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                          minimumSize: Size(75, 35),
                        ),
                        onPressed: onPressedTrue,
                      ),
                    ),
                  ],
                  if (!isTwoButton) ...[
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      child: ElevatedButton(
                        child: Text(
                            (buttonString != '') ? buttonString : 'close'.tr,
                            style: whiteFontStyle12),
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
                        ),
                        onPressed: onPressedFalse,
                      ),
                    ),
                  ],
                ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
