import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class OrderTrackingView extends GetView<OrderTrackingController> {
  const OrderTrackingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: 'Order Tracking',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
        child: GetBuilder<OrderTrackingController>(
          builder: (controller) =>Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerX(
                    radius: 50,
                    child: TextX(
                        '${'Remaining'.tr}:  ${controller.getNumberOrderProducts}',color: ColorX.greyDark,style: TextStyleX.titleSmall,)),
                Row(
                  children: [
                    TextX('${'With'.tr}:', color: ColorX.greyDark,style: TextStyleX.titleSmall),
                    const SizedBox(
                      width: 6,
                    ),
                    ContainerX(
                      radius: 50,
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(controller.withUser.image),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextX(controller.withUser.name,style: TextStyleX.titleSmall),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: StyleX.vPaddingApp),
                child: Column(
                    children: [
                      for (StoreX store in controller.getShoppingStores)
                        Column(
                          children: [
                            BasketStoreBarX(
                                store: store,
                                totalPrice:
                                    controller.getTotalShoppingStore(store.id),
                                currency: controller.products.first.currency
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            for (ProductBasketX productBasket in controller
                                .getproductBasketsStore(store.id))
                              ProductBasketCardX(
                                productBasket: productBasket,
                                onDelete: controller.removeproductBasket,
                                onChangeDone:
                                    controller.changeDoneproductBaskets,
                                onAdd: controller.onAddproductBasket,
                                onMinus: controller.onMinusproductBasket,
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
          ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonX(marginHorizontal: StyleX.hPaddingApp,onTap: controller.onSavingChanges, text: 'Saving changes'),
    );
  }
}
