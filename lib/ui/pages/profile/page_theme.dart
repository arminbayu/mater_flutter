import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageTheme extends StatelessWidget {
  PageTheme({
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double height = 175;

    // double height = 100;

    // double height = 275;
    // double width = Get.width * 2;
    // double top = -(height / 2);
    // double left = -(width / 4 + 10);

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: Get.width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, 1),
                colors: [
                  Color(0xffb6edfc),
                  Color(0xffD5EBF6),
                  Colors.white,
                ],
                tileMode: TileMode.mirror,
              ),
            ),
          ),
        ),

        // Container(
        //   height: height,
        //   decoration: BoxDecoration(color: Color(0xffE1F1F8)),
        // ),

        // Positioned(
        //   top: top,
        //   left: left,
        //   child: Container(
        //     height: height,
        //     width: width,
        //     decoration: new BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment(0, 1),
        //         colors: <Color>[
        //           Color(0xffa2e1fc),
        //           Color(0xffc7eeff),
        //           Color(0xffD5EBF6),
        //           Color(0xffedf6fa),
        //         ],
        //         tileMode: TileMode.mirror,
        //       ),
        //       borderRadius: new BorderRadius.all(
        //         Radius.elliptical(width, height),
        //       ),
        //     ),
        //   ),
        // ),
        widget,
      ],
    );
  }
}
