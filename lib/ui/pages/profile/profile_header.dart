import 'package:flutter/material.dart';
import 'package:master/shared/theme.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({
    required this.fullname,
    required this.fp,
  });

  final String fullname;
  final String fp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('profile'.tr, style: greyBoldFontTitleStyle22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: new BoxDecoration(
                    // borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Color(0xffD0D0D0),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
                Text(
                  fullname,
                  style: blackBoldFontStyle14,
                ),
                Divider(color: Colors.transparent, height: 5),
                Row(
                  children: [
                    Text('FP', style: orangeFontStyle12),
                    Text(
                      fp,
                      style: blackFontStyle12,
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
