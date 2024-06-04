import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:thamn/UI/Widget/widget.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class ActiveBasketController extends GetxController {
  RxBool isAllowEditShareOrder = true.obs;
  Rx basket = BasketX(
          id: 0,
          totalPrice: 0,
          totalAmountSaved: 0,
          totalPriceByStore: {},
          status: '')
      .obs;
  List<UserX> users = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  get isRoot => Get.currentRoute == RouteNameX.root;

  Future<void> getData() async {
    try {
      basket.value = await DatabaseX.getObject<BasketX>(
        api: DBContactX.getActiveBasket,
        fromJson: BasketX.fromJson,
      );
      update();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> saveBasket() async {
    try {
      AlertDialogX.loading();
      await DatabaseX.postObject(api: DBContactX.postSaveActiveBasket);
      Get.back();
      basket.value.totalPriceByStore = {};
      basket.value.productsBasket = [];
      update();
      ToastX.success();
    } catch (e) {
      return ToastX.error(message: e);
    }
  }

  Future<void> changeDoneProductBasket(bool val, int productBasketID) async {
    basket.value.productsBasket.firstWhere((x) => x.id == productBasketID).isDone =
        val;
    update();
    try {
      await DatabaseX.postObject(
        api: DBContactX.postChangeDoneProductInBasket,
        body: DBContactX.bodyChangeDoneProductInBasket(id: productBasketID),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> removeProductBasket(int productBasketID) async {
    var product = basket.value.productsBasket
        .firstWhere((productBasket) => productBasket.id == productBasketID);
    basket.value.totalPrice -= product.product.currentPrice * product.quantity;
    basket.value.totalPriceByStore[product.product.storeID] =
        basket.value.totalPriceByStore[product.product.storeID]! -
            product.product.currentPrice * product.quantity;
    if (basket.value.totalPriceByStore[product.product.storeID] == 0) {
      basket.value.totalPriceByStore.remove(product.product.storeID);
    }
    basket.value.productsBasket
        .removeWhere((productBasket) => productBasket.id == productBasketID);
    update();
    try {
      await DatabaseX.removeObjectByID(
          api: DBContactX.deleteProductInActiveBasket, id: productBasketID);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> onAddQuantityProductBasket(int productBasketID) async {
    var index =
        basket.value.productsBasket.indexWhere((x) => x.id == productBasketID);
    if (basket.value.productsBasket[index].quantity < 100) {
      basket.value.productsBasket[index].quantity++;
      basket.value.totalPrice += basket.value.productsBasket[index].product.currentPrice;
      basket.value.totalPriceByStore[basket.value.productsBasket[index].product.storeID] =
          basket.value.totalPriceByStore[
                  basket.value.productsBasket[index].product.storeID]! +
              basket.value.productsBasket[index].product.currentPrice;
      update();
      try {
        await DatabaseX.updateObject(
          api: DBContactX.deleteProductInActiveBasket,
          id: productBasketID,
          body: DBContactX.bodyQuantityProductInBasket(
              quantity: basket.value.productsBasket[index].quantity),
        );
      } catch (e) {
        return Future.error(e);
      }
    }
  }

  Future<void> onMinusQuantityProductsBasket(int productBasketID) async {
    var index =
        basket.value.productsBasket.indexWhere((x) => x.id == productBasketID);
    if (basket.value.productsBasket[index].quantity > 1) {
      basket.value.productsBasket[index].quantity--;
      basket.value.totalPrice -= basket.value.productsBasket[index].product.currentPrice;
      basket.value.totalPriceByStore[basket.value.productsBasket[index].product.storeID] =
          basket.value.totalPriceByStore[
                  basket.value.productsBasket[index].product.storeID]! -
              basket.value.productsBasket[index].product.currentPrice;
      update();
      try {
        await DatabaseX.updateObject(
          api: DBContactX.deleteProductInActiveBasket,
          id: productBasketID,
          body: DBContactX.bodyQuantityProductInBasket(
              quantity: basket.value.productsBasket[index].quantity),
        );
      } catch (e) {
        return Future.error(e);
      }
    }
  }
}
