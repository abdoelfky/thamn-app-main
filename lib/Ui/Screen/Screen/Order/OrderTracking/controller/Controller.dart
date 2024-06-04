import 'package:get/get.dart';
import 'package:thamn/UI/Widget/widget.dart';

import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';

class OrderTrackingController extends GetxController {
  AppControllerX app=Get.find();
  RxBool isAllowEditShareOrder=true.obs;

  onSavingChanges(){
    ToastX.success();
  }

  List<StoreX> get getShoppingStores{
    var ids=productBaskets.map((e) => e.product.storeID).toSet();
    return stores.where((e) => ids.contains(e.id)).toList();
  }
  int get getNumberOrderProducts{
    return productBaskets.fold(0, (previousValue, element) => previousValue+element.quantity);
  }
  getproductBasketsStore(int storeID){
    return productBaskets.where((e) => e.product.storeID==storeID);
  }
  getTotalShoppingStore(int storeID){
    return productBaskets.where((x) => x.product.storeID==storeID).fold(0.0, (previousValue, element) => previousValue+(element.product.currentPrice*element.quantity));
  }
  get getTotalproductBaskets{
    return productBaskets.fold(0.0, (previousValue, element) => previousValue+(element.product.currentPrice*element.quantity));
  }
  get getTotalSavingsproductBaskets{
    return productBaskets.fold(0.0, (previousValue, element) => previousValue+((element.product.previousPrice-element.product.currentPrice)*element.quantity));
  }
  changeDoneproductBaskets(bool val,int id){
    productBaskets[productBaskets.indexWhere((x) => x.id==id)].isDone=val;
    update();
  }
  removeproductBasket(int id){
    productBaskets.removeWhere((x) => x.id==id);
    update();
  }
  onAddproductBasket(int id){
    productBaskets[productBaskets.indexWhere((x) => x.id==id)].quantity++;
    update();
  }
  onMinusproductBasket(int id){
    var index=productBaskets.indexWhere((x) => x.id==id);
    if(productBaskets[index].quantity>1) {
      productBaskets[index].quantity--;
    }
    update();
  }
  UserX withUser=UserX.empty();
  List<StoreX> stores=[
    StoreX(id: 1, logo: ImageX.store1, name: 'بنده',),
    // StoreX(id: '2', logo: ImageX.store2, name: 'حياة مول',nameEn: 'Hayat Mall'),
    // StoreX(id: '3', logo: ImageX.store3, name: 'بانوراما',nameEn: 'Panorama'),
    // StoreX(id: '4', logo: ImageX.store4, name: 'Garrefour',nameEn: 'Garrefour'),
  ];
  late List<ProductX> products=[
    ProductX(id: 1,storeID: 1,unit: 'g',quantity: 300, name: 'ليمون تركي شرحة', image: ImageX.product1,store: stores[0],discount: 50,currentPrice: 24,previousPrice: 30, amountSaved: 0, validTo: '', currency: '', pricePerQuantity: 0, imageHeight: 0, imageWidth: 0, imageX: 0, imageY: 0, vendorID: 1, vendorName: ''),
    // ProductX(id: '2',storeID: '1',priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'تفاح احمر صربي كيلو', nameEn: 'Serbian Red Apple Kg', image: ImageX.product2,store: stores[0],discount: 40,nowPrise: 30,previousPrice: 34),
    // ProductX(id: '3',storeID: '2',priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'جزر وسط', nameEn: 'central islands', image: ImageX.product3,store: stores[1],discount: 40,nowPrise: 18,previousPrice: 25),
    // ProductX(id: '4',storeID: '2',priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'ليمون تركي شرحة', nameEn: 'Turkish Lemon Sharha', image: ImageX.product1,store: stores[1],discount: 50,nowPrise: 24,previousPrice: 27),
    // ProductX(id: '5',storeID: '3',priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'تفاح احمر صربي كيلو', nameEn: 'Serbian Red Apple Kg', image: ImageX.product2,store: stores[2],discount: 40,nowPrise: 30,previousPrice: 36),
    // ProductX(id: '6',storeID: '4',priceOnStandardQuantity: 'SR 21/1Kg',unit: 'g',quantity: 300, name: 'جزر وسط', nameEn: 'central islands', image: ImageX.product3,store: stores[3],discount: 40,nowPrise: 18,previousPrice: 20),
  ];
  late List<ProductBasketX> productBaskets=[
    // ProductBasketX(id: 1, quantity: 3, productID: '1',product: products[0]),
    // ProductBasketX(id: '2',note: 'اجلب اي منتج مشابه اذا مالقيت هذا المنتج كثير مهم تجيبه', quantity: 5, productID: '2',product: products[1]),
    // ProductBasketX(id: '3', quantity: 1, productID: '3',product: products[2]),
    // ProductBasketX(id: '4', quantity: 6, productID: '4',product: products[3]),
    // ProductBasketX(id: '5', quantity: 10, productID: '5',product: products[4]),
    // ProductBasketX(id: '6', quantity: 4, productID: '6',product: products[5]),
  ];
}