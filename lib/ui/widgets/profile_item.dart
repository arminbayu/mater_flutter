import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileItem extends StatelessWidget {
  ProfileItem({
    required this.title,
    required this.subTitle,
    required this.onTap,
    this.isRequired = false,
  });

  final String title;
  final String subTitle;
  final Function() onTap;
  bool isRequired;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: blackBoldFontStyle14),
                        SizedBox(width: 5),
                        (isRequired)
                            ? Icon(FontAwesomeIcons.circleExclamation,
                                color: errorDefaultColor, size: 12)
                            : SizedBox(),
                      ],
                    ),
                    Divider(color: Colors.transparent, height: 5),
                    Text(subTitle, style: greyFontStyle14),
                  ],
                ),
              ],
            ),
            Icon(
              FontAwesomeIcons.angleRight,
              color: mainColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
