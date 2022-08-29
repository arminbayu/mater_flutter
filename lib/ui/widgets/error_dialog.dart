import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_alert.dart';

class ErrorDialog {
  static showErrorDialog(
    BuildContext context,
    Function() onPressedFalse,
    String message,
    String buttonText,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomAlert(
          onPressedTrue: () {},
          onPressedFalse: onPressedFalse,
          Title: "title_alert".tr,
          Message: (message == '') ? 'message_network_error'.tr : message,
          isTwoButton: false,
          buttonString: (buttonText == '') ? 'close'.tr : buttonText,
        );
      },
    );
  }
}
