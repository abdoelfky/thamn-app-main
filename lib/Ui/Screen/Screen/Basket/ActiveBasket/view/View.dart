import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thamn/Ui/EmptyState/empty.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../EmptyState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/bottomNavBarSection.dart';

class ActiveBasketView extends GetView<ActiveBasketController> {
  const ActiveBasketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.isRoot?null:AppBar(title: const TextX('My Basket'),),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: ErrorView(
                error: snapshot.error.toString(),
              ),
            );
          }
          return GetBuilder<ActiveBasketController>(builder: (controller) {
            return controller.basket.value.getStores.isEmpty
                ? const Center(
                    child: EmptyView(),
                  )
                : Scaffold(
                    body: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: StyleX.hPaddingApp,
                          vertical: StyleX.vPaddingApp),
                      child: Column(children: [
                        for (StoreX store in controller.basket.value.getStores)
                          Column(
                            children: [
                              BasketStoreBarX(
                                store: store,
                                totalPrice: controller
                                        .basket.value.totalPriceByStore[store.id] ??
                                    0,
                                currency: controller.basket.value.productsBasket.first
                                    .product.currency,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              for (ProductBasketX productBasket in controller
                                  .basket.value
                                  .getProductBasketByStore(store.id))
                                ProductBasketCardX(
                                  productBasket: productBasket,
                                  onDelete: controller.removeProductBasket,
                                  onChangeDone:
                                      controller.changeDoneProductBasket,
                                  onAdd: controller.onAddQuantityProductBasket,
                                  onMinus:
                                      controller.onMinusQuantityProductsBasket,
                                ),
                              if(controller.basket.value.getStoresIDs.last!=store.id)
                              const Padding(
                                padding: EdgeInsets.only(top: 4.0, bottom: 14),
                                child: Divider(),
                              ),
                            ],
                          ),
                      ]),
                    ),
                    bottomNavigationBar: const ActiveBasketNavBarSection(),
                  );
          });
        },
      ),
    );
  }
}
