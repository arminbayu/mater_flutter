import 'package:master/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(top: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("news".tr, style: blackBoldFontStyle14),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(margin: EdgeInsets.only(left: 10)),
              for (var index = 0; index < 10; index++) ...[
                GestureDetector(
                  onTap: () {
                    print('/news/detail_news');
                  },
                  child: boxNews(index.toString()),
                ),
              ],
              Container(margin: EdgeInsets.only(right: 10)),
            ],
          ),
        ),
        Divider(
          color: Colors.transparent,
          height: 30,
        ),
      ],
    );
  }

  Widget boxNews(String title) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: new BoxDecoration(
        color: orangeNewsColor,
        border: Border.all(color: greyDefaultColor, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/fasapay_logo.png")),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                    title +
                        " Description here : asd askdh askdas das da dkahsd",
                    style: blackFontStyle12),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  print('/news/detail_news');
                  // Get.toNamed('/news/detail_news', arguments: title);
                },
                child: Text("read_more".tr, style: blackBoldFontStyle12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
