import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class ActiveBasketNavBarSection extends GetView<ActiveBasketController> {
  const ActiveBasketNavBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActiveBasketController>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            color:
                context.isDarkMode ? Theme.of(context).cardColor : Colors.white,
            boxShadow: const [StyleX.shadow]),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border:
                                Border.all(color: ColorX.primary, width: 2)),
                        padding: const EdgeInsets.all(7),
                        margin: const EdgeInsets.only(top: 6, left: 6),
                        child: Icon(Iconsax.shopping_cart,
                            color: ColorX.primary, size: 20),
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: ColorX.primary,
                            child: TextX(
                              controller.basket.value.productsBasket.length
                                  .toString(),
                              color: Colors.white,
                              style: TextStyleX.titleSmall,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ContainerX(
                    child: NumberDoubleText(
                      controller.basket.value.totalPrice,
                      firstText: '${'Total'.tr}: ',
                      style: TextStyleX.titleSmall,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  NumberDoubleText(controller.basket.value.totalAmountSaved,
                      firstText: '${'Total Savings'.tr}: ',
                      style: TextStyleX.titleSmall,
                      color:
                          context.isDarkMode ? Colors.white : ColorX.primary,
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await AlertDialogX.okAndCancel(
                        title: 'Save Basket',
                        message:
                            'Do you want to save the basket in the archives? It will disappear from here and be moved to the Saved Baskets section.',
                        onOk: controller.saveBasket,
                      );
                    },
                    child: ContainerX(
                      padding: EdgeInsets.zero,
                      width: 40,
                      height: 40,
                      color: ColorX.secondary.withOpacity(0.15),
                      child: Center(
                        child: Icon(
                          Icons.bookmark_border_rounded,
                          size: 25,
                          color: ColorX.primary,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 8,
                  // ),
                  // GestureDetector(
                  //   onTap: () => bottomSheetX(
                  //     title: 'Share Product',
                  //     padding: EdgeInsets.zero,
                  //     child: Column(
                  //       children: [
                  //         ShareProductX(users: controller.users),
                  //         const SizedBox(
                  //           height: 15,
                  //         ),
                  //         const Divider(
                  //           endIndent: 30,
                  //           indent: 30,
                  //         ),
                  //         const SizedBox(
                  //           height: 15,
                  //         ),
                  //         Row(
                  //           children: [
                  //             Obx(
                  //               () => Checkbox(
                  //                 value: controller.isAllowEditShareOrder.value,
                  //                 onChanged: (val) {
                  //                   controller.isAllowEditShareOrder.value =
                  //                       val ?? true;
                  //                 },
                  //               ),
                  //             ),
                  //             const Expanded(
                  //                 child: TextX(
                  //               'Allow me to give the power to amend my orders',
                  //               maxLines: 3,
                  //             ))
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   child: ContainerX(
                  //       padding: EdgeInsets.zero,
                  //       width: 40,
                  //       height: 40,
                  //       color: ColorX.secondary.withOpacity(0.15),
                  //       child: Center(
                  //           child: Icon(
                  //         Iconsax.share,
                  //         size: 25,
                  //         color: ColorX.primary,
                  //       ))),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
