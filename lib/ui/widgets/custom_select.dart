import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSelect extends StatelessWidget {
  CustomSelect({
    required this.title,
    required this.width,
    this.height = 35,
    required this.onTab,
    required this.textCenter,
    this.withPrefix = false,
    this.prefix = const Text(""),
    this.withSuffix = false,
    this.suffix,
    this.backroundColor = const Color(0xffEAEAEA),
    this.borderColor = const Color(0xffBDBDBD),
  });

  final String title;
  final double width;
  final double height;
  final bool textCenter;
  final bool withPrefix;
  final Widget prefix;
  final bool withSuffix;
  final Widget? suffix;
  final Function() onTab;
  final Color backroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    double prefixWidth = (withPrefix) ? 25 : 0;
    double suffixWidth = (withSuffix) ? 25 : 0;

    double _width = width - 25 - prefixWidth - suffixWidth;

    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: new BoxDecoration(
          color: backroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: borderColor, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            if (withPrefix) ...[
              Container(
                width: 25,
                child: Align(
                  alignment: Alignment.center,
                  child: prefix,
                ),
              ),
            ],
            Container(
              width: _width,
              child: Align(
                alignment: textCenter ? Alignment.center : Alignment.centerLeft,
                child: Text(title, style: blackBoldFontStyle12),
              ),
            ),
            if (withSuffix) ...[
              Container(
                width: 25,
                child: Align(
                  alignment: Alignment.center,
                  child: suffix,
                ),
              ),
            ],
            // Text(title, style: blackBoldFontStyle14),
            // (suffix != null) ?
            // Icon(FontAwesomeIcons.caretDown, color: Colors.black, size: 15),
          ],
        ),
      ),
    );
  }
}
