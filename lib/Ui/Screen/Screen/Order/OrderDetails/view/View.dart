import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../controller/Controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Order Details'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ContainerX(
              radius: 50,
              child: Row(
                children: [
                  const Icon(Icons.date_range, size: 20),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 70,
                    child: TextX(
                      controller.order.date,
                      style: TextStyleX.titleSmall,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                TextX('${'With'.tr}:',color: ColorX.greyDark),
                const SizedBox(width: 6,),
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
                        child: TextX(controller.withUser.name),
                      ),
                      const SizedBox(width: 5,),
                    ],
                  ),
                )
              ],
            )
          ],),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: StyleX.vPaddingApp),
              child: Column(children: [
              for (ProductX product in  controller.products)
                ContainerX(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                  Row(
                    children: [
                      Icon(controller.order.canceledProductsIDs.contains(product.id)?Icons.close_rounded:Icons.check_rounded,color: controller.order.canceledProductsIDs.contains(product.id)?ColorX.danger:ColorX.success,),
                      const SizedBox(width: 10,),
                          SizedBox(width: 120,child: TextX(product.name,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                    ],
                  ),
                  TextX('${product.quantity} ${product.unit}'),
                  TextX('${product.currentPrice} ${product.currency.tr}'),
                ],))
            ]),),
          )
        ]),
      ),
    );
  }
}
