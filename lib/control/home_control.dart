import 'package:master/ui/widgets/error_dialog.dart';
import 'package:get/get.dart';

class HomeControl {
  static start(context) async {
    String page = "1";
    try {
      return {
        "history": [],
        "user": [],
        "balance": [],
      };
    } catch (e) {
      ErrorDialog.showErrorDialog(
          context, () => Get.offAllNamed("/home"), "", "reload".tr);
    }
  }
}
