import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import '../../../../../Config/config.dart';
import '../../../../../Core/core.dart';
import '../../../../../Data/data.dart';
import '../../../../../UI/Widget/widget.dart';

class SetLocationController extends GetxController {
  AppControllerX app =Get.find();
  LatLng currentLatLng = Get.arguments?[0]??const LatLng(24.695174, 46.680504);
  bool isFromUpdate=Get.arguments?[1]??false;

  onNext(GeocodingResult? result)async{
    if(result!=null){
      app.location= LatLng(result.geometry.location.lat,result.geometry.location.lng);
      AlertDialogX.loading();
      app.locationName =result.formattedAddress??'';
      app.update();
      Get.back();
      try {
       await DatabaseX.updateObject(api: DBContactX.postUpdateLocationByLatLon, body: DBContactX.bodyUpdateLocationByLatLon(latitude: app.location.latitude, longitude: app.location.longitude, location: app.locationName));
       if(isFromUpdate){
         Get.back();
       }else{
         LocalDataX.put(LocalNames.route,RouteNameX.storesSelection);
         Get.offAllNamed(RouteNameX.storesSelection);
       }
      } catch (e) {
        Get.back();
        ToastX.error(message: e);
      }
    }else{
      if(isFromUpdate){
        Get.back();
      }else{
        LocalDataX.put(LocalNames.route,RouteNameX.storesSelection);
        Get.offAllNamed(RouteNameX.storesSelection);
      }
    }
   }
}
