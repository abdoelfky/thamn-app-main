import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../../../Core/core.dart';

class ProfileController extends GetxController {
  AppControllerX app = Get.find();
  Future<void> shareText(String text) async {
    try {

      // مشاركة النص والصور
      await Share.share(text);


    } catch (e) {
      print('Error: $e');

    }
  }


}
