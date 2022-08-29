import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.onText,
    this.margin = const EdgeInsets.all(10),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    required this.onRadius,
    required this.isActive,
    this.isOutline = false,
    required this.btnColor,
    this.withShareButton = false,
    this.onPressedShare,
  });
  final VoidCallback onPressed;
  final Widget onText;
  EdgeInsets margin;
  EdgeInsets padding;
  final double onRadius;
  final bool isActive;
  bool isOutline;
  Color btnColor;
  bool withShareButton;
  Function()? onPressedShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (withShareButton) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width - 100,
                  height: 50,
                  child: ElevatedButton(
                    child: onText,
                    style: ElevatedButton.styleFrom(
                      primary: (isActive) ? btnColor : greyColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(onRadius),
                      ),
                    ),
                    onPressed: (isActive) ? onPressed : null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: mainColor,
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.shareAlt,
                      color: Colors.white,
                      size: 38,
                    ),
                    onTap: onPressedShare,
                  ),
                ),
              ],
            ),
          ] else ...[
            ElevatedButton(
              child: onText,
              style: ElevatedButton.styleFrom(
                primary: (isOutline)
                    ? Colors.white
                    : ((isActive) ? btnColor : greyColor),
                padding: padding,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: (isOutline) ? 1.0 : 0,
                    color: (isOutline) ? Colors.blue : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(onRadius),
                ),
              ),
              onPressed: (isActive) ? onPressed : null,
            ),
          ]
        ],
      ),
    );
  }
}
