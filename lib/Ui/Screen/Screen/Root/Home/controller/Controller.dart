import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/widget.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  AppControllerX app = Get.find();

  RxInt selectedCategoryID = 0.obs;
  RxInt selectedSubcategoryID = 0.obs;
  RxBool isProductsTap = false.obs;
  List<StoreX> stores = [];

  RxList<ProductX> products = <ProductX>[].obs;
  RxBool isLoadingGetAllProducts = false.obs;

  List<ProductX> mostOffersProducts = [];
  List<ProductX> favoriteProducts = [];

  List<CategoryX> categories = [];

  getData() async {
    if (categories.isEmpty ||
        products.isEmpty ||
        mostOffersProducts.isEmpty ||
        favoriteProducts.isEmpty) {
      try {
        stores = await DatabaseX.getAll<StoreX>(
            api: DBContactX.getStores, fromJson: StoreX.fromJson);
        categories = await DatabaseX.getCategories();
        mostOffersProducts = await DatabaseX.getAll<ProductX>(
            api: DBContactX.getMostDiscountedProducts,
            fromJson: ProductX.fromJson);
        for (int i = 0; i < mostOffersProducts.length; i++) {
          mostOffersProducts[i].store = stores.firstWhereOrNull(
                  (store) => mostOffersProducts[i].storeID == store.id);
        }
        await getAllProducts();
      } catch (e) {
        return Future.error(e);
      }
    }
  }

  getFavoriteProducts() async {
    try {
      favoriteProducts = await DatabaseX.getAll<ProductX>(
          api: DBContactX.getFavoriteProducts, fromJson: ProductX.fromJson);
      for (int i = 0; i < favoriteProducts.length; i++) {
        favoriteProducts[i].store = stores.firstWhereOrNull(
                (store) => favoriteProducts[i].storeID == store.id);
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  getAllProducts() async {
    try {
      isLoadingGetAllProducts.value = true;
      if (selectedCategoryID.value != 0 && selectedSubcategoryID.value == 0) {
        products.value = await DatabaseX.getAllByID<ProductX>(
            api: DBContactX.getProductsByCategory,
            id: selectedCategoryID.value,
            fromJson: ProductX.fromJson);
      } else if (selectedSubcategoryID.value != 0) {
        products.value = await DatabaseX.getAllByID<ProductX>(
            api: DBContactX.getProductsByCategory,
            id: selectedSubcategoryID.value,
            fromJson: ProductX.fromJson);
      } else {
        products.value = await DatabaseX.getAll<ProductX>(
            api: DBContactX.getProducts, fromJson: ProductX.fromJson);
      }
      for (int i = 0; i < products.length; i++) {
        products[i].store =
            stores.firstWhereOrNull((store) => products[i].storeID == store.id);
      }
      isLoadingGetAllProducts.value = false;
    } catch (e) {
      isLoadingGetAllProducts.value = false;
      ToastX.error(message: e);
    }
  }

  List<SubcategoryX> get getSubcategories {
    if (selectedCategoryID.value != 0) {
      return categories
          .firstWhere(
            (x) => x.id == selectedCategoryID.value,
      )
          .subcategories;
    } else {
      return [];
    }
  }

  changeSelectedCategory(int id) async {
    if (id == selectedCategoryID.value) {
      selectedCategoryID.value = 0;
    } else {
      selectedCategoryID.value = id;
    }
      await getAllProducts();
    selectedSubcategoryID.value = 0;
  }

  changeSelectedSubCategory(id) async {
    if (id != selectedSubcategoryID.value) {
      selectedSubcategoryID.value = id;
      await getAllProducts();
    }
  }

  void changeTap() {
    if (tabController.index == 1) {
      isProductsTap.value = true;
    } else {
      isProductsTap.value = false;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(changeTap);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
