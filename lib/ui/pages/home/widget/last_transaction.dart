import 'package:master/func/format_date.dart';
import 'package:master/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastTransaction extends StatelessWidget {
  LastTransaction({
    required this.listHistory,
    required this.image,
  });

  List listHistory;
  final String image;

  Map<String, dynamic> tipe = {
    "topup": 'topup'.tr,
    "Transfer In": 'transfer_in'.tr,
    "Transfer Out": 'transfer_out'.tr,
    "redeem": 'withdraw'.tr,
  };

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    int length = listHistory.length;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('last_transactions'.tr, style: blackBoldFontStyle14),
            ],
          ),
        ),
        if (length == 0) ...[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Image(image: AssetImage(image), width: Get.width / 1.5),
            ),
          ),
        ] else ...[
          for (var index = 0; index < length; index++) ...[
            GestureDetector(
              onTap: () {
                onTabDetail(
                  listHistory[index]['type'],
                  listHistory[index]['batchnumber'],
                );
              },
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 5,
                  top: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: (listHistory[index]["status"] == "FINISH")
                                ? Colors.green
                                : (listHistory[index]["status"] == "PENDING")
                                    ? Colors.amber[700]
                                    : Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          ),
                          child: Icon(
                            (listHistory[index]["status"] == "FINISH")
                                ? Icons.check_rounded
                                : (listHistory[index]["status"] == "PENDING")
                                    ? Icons.keyboard_control_sharp
                                    : Icons.close_rounded,
                            color: Colors.white,
                            size: 35.0,
                          ),
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FormatDate.format(listHistory[index]["datetime"],
                                      "d-MM-yyy") ??
                                  "-",
                              style: blackFontStyle12,
                            ),
                            Text(
                              tipe[listHistory[index]["type"]] ??
                                  listHistory[index]["type"],
                              style: blackBoldFontStyle12,
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text("100 USD", style: blackBoldFontStyle14),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ]
      ],
    );
  }
}

onTabDetail(String type, String batchnumber) {
  print("ONTAP");
}
