import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thamn/Config/config.dart';
import 'package:thamn/Ui/Screen/Screen/Basket/ActiveBasket/controller/Controller.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';

class ProductDetailsController extends GetxController {
  final ActiveBasketController basketController = Get.find<ActiveBasketController>();

  AppControllerX app = Get.find();
  RxBool isShowUnitPrice = false.obs;
  RxInt id = 0.obs;
  late ProductX product;
  List<ProductX> comparableProducts = [];
  List<ProductX> genericProducts = [];
  List<SubcategoryX> vendorsSubcategories = [];
  RxBool isLoadingComparableProducts = false.obs;
  RxBool isFavorite = false.obs;
  double quantity = 1;
  RxBool doneGetData = false.obs;

  showBasket() {
    Get.toNamed(RouteNameX.activeBasket);
  }

  onTapFavorite() async {
    isFavorite.value = !isFavorite.value;
    try {
      if (isFavorite.isTrue) {
        await DatabaseX.addProductToFavorite(id: product.id);
      } else {
        await DatabaseX.removeObjectByID(api: DBContactX.deleteProductFromFavorite, id: product.id);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  getData({productId}) async {
    try {
      this.id.value = productId;
      doneGetData.value = false;
      product = await DatabaseX.getProduct(id: id);
      isFavorite.value = product.isFavorite;
      genericProducts = await DatabaseX.getAllByID(
        id: product.id,
        api: DBContactX.getGenericProducts,
        fromJson: ProductX.fromJson,
      );
      comparableProducts = await DatabaseX.getAllByID<ProductX>(
        id: product.id,
        api: DBContactX.getComparableProductsForAllVendors,
        fromJson: ProductX.fromJson,
      );
      vendorsSubcategories = await DatabaseX.getAllByID<SubcategoryX>(
        id: product.id,
        api: DBContactX.getVendorsForProduct,
        fromJson: SubcategoryX.fromJson,
      );
      doneGetData.value = true;
    } catch (e) {
      return Future.error(e);
    }
  }

  changeShowUnitPrice(val) {
    app.isShowUnitPrice = isShowUnitPrice.value = val;
  }

  changeProduct(int id) async {
    this.id.value = id;
    product = ProductX.empty();
    comparableProducts = [];
    genericProducts = [];
    vendorsSubcategories = [];
    isLoadingComparableProducts = false.obs;
    isFavorite = false.obs;
    quantity = 1;
    doneGetData = false.obs;
    selectedSubcategoryID = 0.obs;
    users = [];
    note.text = '';
    update();
  }

  /////////////////////////////////////////////////////////////////////////////

  RxInt selectedSubcategoryID = 0.obs;
  List<UserX> users = [];
  TextEditingController note = TextEditingController();

  Future<void> addToList(id) async {
    try {
      Get.back();
      AlertDialogX.loading();
      await DatabaseX.postObject(
        id: id,
        api: DBContactX.postAddProductToBasket,
        body: DBContactX.bodyAddProductToBasket(quantity: quantity.toInt(), note: note.text),
      );
      note.text = '';
      Get.back();
      ToastX.success();
      basketController.getData();
    } catch (e) {
      Get.back();
      ToastX.error(message: e);
    }
  }

  changeSelectedSubCategory(id) async {
    if (id != selectedSubcategoryID.value) {
      selectedSubcategoryID.value = id;
      isLoadingComparableProducts.value = true;
      try {
        if (selectedSubcategoryID.value == 0) {
          comparableProducts = await DatabaseX.getAllByID<ProductX>(
            id: product.id,
            api: DBContactX.getComparableProductsForAllVendors,
            fromJson: ProductX.fromJson,
          );
        } else {
          comparableProducts = await DatabaseX.getAll<ProductX>(
            api: DBContactX.getComparableProductsForVendorID(vendorID: id, productID: product.id),
            fromJson: ProductX.fromJson,
          );
        }
      } catch (e) {
        isLoadingComparableProducts.value = false;
        return Future.error(e);
      }
      isLoadingComparableProducts.value = false;
    }
  }
}
