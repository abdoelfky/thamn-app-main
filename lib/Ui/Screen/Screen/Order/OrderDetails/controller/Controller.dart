import 'package:get/get.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class OrderDetailsController extends GetxController {
  OrderX order =Get.arguments;
  UserX withUser=UserX.empty();
  List<ProductX> products=[
    // ProductX(id: '1',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'ليمون تركي شرحة', nameEn: 'Turkish Lemon Sharha', image: ImageX.product1,discount: 50,nowPrise: 24,previousPrice: 60),
    // ProductX(id: '2',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 20, name: 'تفاح احمر صربي كيلو', nameEn: 'Serbian Red Apple Kg', image: ImageX.product2,discount: 40,nowPrise: 30,previousPrice: 65),
    // ProductX(id: '3',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 880, name: 'جزر وسط', nameEn: 'central islands', image: ImageX.product3,discount: 40,nowPrise: 18,previousPrice: 25),
    // ProductX(id: '4',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'ليمون تركي شرحة', nameEn: 'Turkish Lemon Sharha', image: ImageX.product1,discount: 50,nowPrise: 24,previousPrice: 60),
    // ProductX(id: '5',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'تفاح احمر صربي كيلو', nameEn: 'Serbian Red Apple Kg', image: ImageX.product2,discount: 40,nowPrise: 30,previousPrice: 65),
    // ProductX(id: '6',storeid: 0,priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'جزر وسط', nameEn: 'central islands', image: ImageX.product3,discount: 40,nowPrise: 18,previousPrice: 25),
  ];
}