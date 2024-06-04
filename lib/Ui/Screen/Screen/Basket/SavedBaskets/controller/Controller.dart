import 'package:get/get.dart';
import '../../../../../../Data/data.dart';

class SavedBasketsController extends GetxController {
  List<BasketX> savedBaskets=[];
  getData()async{
    try{
      savedBaskets=await DatabaseX.getAll<BasketX>(api: DBContactX.getSavedBaskets, fromJson: BasketX.fromJson);
    }catch(e){
      return Future.error(e);
    }
  }
}