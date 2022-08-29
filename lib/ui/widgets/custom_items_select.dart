import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:get/get.dart';

class CustomItemsSelect extends StatelessWidget {
  CustomItemsSelect({
    this.margin = const EdgeInsets.symmetric(horizontal: 75),
    required this.selected,
    required this.height,
    required this.items,
    this.fontSize = 20,
  });

  final EdgeInsetsGeometry margin;
  final String selected;
  final double height;
  final double fontSize;
  List<dynamic> items = [
    {"value": "value", "text": "string"}
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          margin: margin,
          padding: EdgeInsets.all(20),
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (int i = 0; i < items.length; i++) ...[
                  _item(
                    context,
                    items[i]['value'],
                    items[i]['text'],
                  ),
                  if ((i + 1) != items.length) ...[
                    Divider(color: greyDefaultColor),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  _item(BuildContext context, String value, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, {"text": text, "value": value});
      },
      child: Container(
        width: Get.width,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: (value == selected) ? mainColor : Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "roboto",
          ),
        ),
      ),
    );
  }
}
