import 'package:get/get.dart';
import 'package:thamn/UI/Widget/widget.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class StoresSelectionController extends GetxController {
  RxList<int> selectedStoresIDs= <int>[].obs;
  List<StoreX> stores=[];
  getData()async{
    try{
      stores= await DatabaseX.getAll<StoreX>(api: DBContactX.getStores, fromJson: StoreX.fromJson);
    }catch(e){
      return Future.error(e);
    }
  }
  selecting(int id){
    if(selectedStoresIDs.contains(id)){
      selectedStoresIDs.remove(id);
    }else{
      selectedStoresIDs.add(id);
    }
  }
  onTapNext()async{
    try{
      if(selectedStoresIDs.isNotEmpty){
        AlertDialogX.loading();
        await DatabaseX.updateObject(api: DBContactX.postSelectStores, body: DBContactX.bodySelectStores(storesIDs: selectedStoresIDs.value));
      }
      LocalDataX.put(LocalNames.route,RouteNameX.root);
      Get.offAllNamed(RouteNameX.root);
    }catch(e){
      Get.back();
      ToastX.error(message: e);
    }
    
  }
}