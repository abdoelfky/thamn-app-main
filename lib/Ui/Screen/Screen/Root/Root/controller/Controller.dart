import 'package:get/get.dart';
import 'package:thamn/UI/Screen/Screen/Product/ProductDetails/controller/Controller.dart';
import 'package:thamn/Ui/Screen/Screen/Product/ProductDetails/view/View.dart';
import 'package:thamn/Ui/Screen/Screen/Search/Searching/view/View.dart';
import '../../../../../../Core/core.dart';
import '../../../Basket/ActiveBasket/view/View.dart';
import '../../Home/view/View.dart';
import '../../Profile/Profile/view/View.dart';

class RootController extends GetxController {
  AppControllerX app = Get.find();
  RxInt indexSelected = 0.obs;
  RxInt pageSelected = 0.obs;
  RxInt productId = 0.obs;

  onItemSelected(int index) {
    indexSelected.value = index;
    pageSelected.value = index;
  }

  changePage(int index, {productID}) {
    pageSelected.value = index;
    if(pageSelected.value == 4)
    {
      productId.value = productID ;
    }

  }

  Future<bool> onWillPop() async {
    if (pageSelected.value != 0) {
      indexSelected.value = 0;
      pageSelected.value = 0;
      return false;
    }
    return true;
  }

  pageRoot() {
    switch (pageSelected.value) {
      case 0:
        return const HomeView();
      case 1:
        return const ActiveBasketView();
      case 2:
        return const ProfileView();
      case 3:
        return const SearchingView();
      case 4:
        return const ProductDetailsView();
    }
  }
}
