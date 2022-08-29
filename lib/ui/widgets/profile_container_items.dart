import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:get/get.dart';

class ProfileContainerItems extends StatelessWidget {
  ProfileContainerItems({
    required this.children,
    required this.maxHeight,
    required this.title,
  });

  List<Widget> children;
  double maxHeight;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title, style: blackBoldFontStyle16),
            ),
          ),
          Container(
            width: Get.width - 25,
            padding: EdgeInsets.all(20),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: greyColor, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: maxHeight,
              ),
              child: SingleChildScrollView(
                child: Column(children: children),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
