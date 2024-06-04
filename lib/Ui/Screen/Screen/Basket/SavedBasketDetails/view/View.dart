import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/bottomNavBarSection.dart';

class SavedBasketDetailsView extends GetView<SavedBasketDetailsController> {
  const SavedBasketDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Saved Basket'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
            vertical: StyleX.vPaddingApp),
        child: Column(children: [
          for (StoreX store in controller.basket.getStores)
            Column(
              children: [
                BasketStoreBarX(
                  store: store,
                  totalPrice: controller
                      .basket.totalPriceByStore[store.id] ??
                      0,
                  currency: controller.basket.productsBasket.first
                      .product.currency,
                ),
                const SizedBox(
                  height: 15,
                ),
                for (ProductBasketX productBasket in controller
                    .basket
                    .getProductBasketByStore(store.id))
                  ProductSavedBasketCardX(
                    productBasket: productBasket,
                  ),
                if(controller.basket.getStoresIDs.last!=store.id)
                  const Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 14),
                    child: Divider(),
                  ),
              ],
            ),
        ]),
      ),
      bottomNavigationBar: const SavedBasketNavBarSection(),
    );
  }
}
