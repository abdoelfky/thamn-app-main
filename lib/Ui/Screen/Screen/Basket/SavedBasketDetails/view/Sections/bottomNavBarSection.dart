import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class SavedBasketNavBarSection extends GetView<SavedBasketDetailsController> {
  const SavedBasketNavBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedBasketDetailsController>(
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
                              controller.basket.productsBasket.length
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
                      child: TextX(
                    '${'Total'.tr}  ${controller.basket.totalPrice}',
                    style: TextStyleX.titleSmall,
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  TextX(
                      '${'Total Savings'.tr}:  ${controller.basket.totalAmountSaved}',
                      style: TextStyleX.titleSmall,
                      color:
                          context.isDarkMode ? Colors.white : ColorX.primary),
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
                        title: 'Activate the saved basket',
                        message:
                            'Do you want to move this saved basket to the current basket?',
                        textOK: 'Merge',
                        onOk: ()async=>controller.returnSaveBasketToActive(1),
                        textOK2: 'Replace',
                        onOk2: ()async=>controller.returnSaveBasketToActive(2),
                        colorTextCancel:ColorX.danger
                      );
                    },
                    child: ContainerX(
                      padding: EdgeInsets.zero,
                      width: 40,
                      height: 40,
                      color: ColorX.secondary.withOpacity(0.15),
                      child: Center(
                        child: Icon(
                          Iconsax.refresh,
                          size: 25,
                          color: ColorX.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
