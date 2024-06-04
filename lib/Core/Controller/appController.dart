part of core;

class AppControllerX extends GetxController {
  UserX user=UserX.empty();
  bool isShowUnitPrice=false;
  init()async{
    if(LocalDataX.token!=''){
      try{
        user=await DatabaseX.getProfile();
        update();
      }catch(_){}
    }
  }

  /////////////////////////////////////////////////////////////////////////////

  late LatLng location = LatLng(user.latitude, user.longitude);
  late String locationName = user.location;
  bool get locationIsNotEmpty =>
      location.longitude != 0 && location.latitude != 0;
  setLocation(){
    Get.toNamed(RouteNameX.setLocation,arguments: [locationIsNotEmpty?location:null,true]);
  }
  /////////////////////////////////////////////////////////////////////////////
  editProfile() async {
    await Get.toNamed(RouteNameX.editProfile);
    AlertDialogX.loading();
    await init();
    Get.back();
  }
  logOut()async{
    try{
      String? message = await DatabaseX.logout();
      LocalDataX.put(LocalNames.token, '');
      LocalDataX.put(LocalNames.route, RouteNameX.login);
      Get.offAllNamed(RouteNameX.login);
      ToastX.success(title: message);
    }catch (e) {
      return Future.error(e);
    }
  }
}
