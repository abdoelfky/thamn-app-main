import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';

class SideMenuController extends GetxController {
  AppControllerX app =Get.find();
  editProfile()async{
    await Get.toNamed(RouteNameX.editProfile);
    update();
  }
}
