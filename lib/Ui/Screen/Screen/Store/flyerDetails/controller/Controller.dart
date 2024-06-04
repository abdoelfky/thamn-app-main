import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Data/data.dart';


class FlyerDetailsController extends GetxController {
  RxInt selectedFlyerPageIndex=0.obs;
  StoreX store=Get.arguments[0];
  FlyerX flyer=Get.arguments[1];
  List<FlyerPageX> flyerPages=[];

  PageController pageController=PageController(initialPage: 0);
  getData()async{
    try{
      flyerPages= await DatabaseX.getFlyerPages(id:flyer.id);
    }catch(e){
      return Future.error(e);
    }
  }

  double convertImageSizeToMobileSize({required FlyerPageX flyerPage,required int size}){
    double imageScaleRatio= Get.width/flyerPage.imageWidth;
    return size*imageScaleRatio;
  }

  changeFlyerPage(index,{bool jumpToPage=false}){
    if(index!=selectedFlyerPageIndex.value){
      selectedFlyerPageIndex.value=index;
      if(!jumpToPage) {
        pageController.jumpToPage(index);
      }
    }
  }
}