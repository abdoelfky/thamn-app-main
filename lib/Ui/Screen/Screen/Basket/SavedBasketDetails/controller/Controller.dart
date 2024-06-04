import 'package:get/get.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';

class SavedBasketDetailsController extends GetxController {
  late BasketX basket= Get.arguments;
  returnSaveBasketToActive(int option)async{
    try{
      AlertDialogX.loading();
      await DatabaseX.postObject(api: DBContactX.postReturnSaveBasketToActive,id: basket.id,body: DBContactX.bodyReturnSaveBasketToActive(option: option));
    Get.back();
    ToastX.success();
    }catch(e){
      Get.back();
      ToastX.error(message: e);
    }
  }
}