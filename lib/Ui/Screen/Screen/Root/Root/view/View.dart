import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:thamn/Ui/Screen/Screen/Basket/ActiveBasket/controller/Controller.dart';
import 'package:thamn/Ui/Widget/Basic/myNavBar.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/error.dart';
import '../../../../Basic/SideMenu/view/View.dart';
import '../controller/Controller.dart';

class RootView extends GetView<RootController> {
  RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActiveBasketController basketController = Get.find<ActiveBasketController>();

    return Scaffold(
      body: FutureBuilder(
        future: controller.app.init(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(
              error: snapshot.error.toString(),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return WillPopScope(
            onWillPop: controller.onWillPop,
            child: Scaffold(
              appBar: AppBarRootX(
                title: Obx(() {
                  if (controller.indexSelected.value == 0 && controller.pageSelected.value == 0) {
                    return GestureDetector(
                      onTap: () => controller.changePage(3),
                      child: ContainerX(
                        height: 45,
                        child: Row(
                          children: <Widget>[
                            Icon(Iconsax.search_normal_1, color: ColorX.greyDark),
                            const SizedBox(width: 20.0),
                            TextX(
                              'Search for anything',
                              style: TextStyleX.titleSmall,
                              color: ColorX.greyDark,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (controller.indexSelected.value == 1) {
                    return const TextX('My Basket');
                  } else if (controller.pageSelected.value == 3) {
                    return const TextX('Search for anything');
                  } else if (controller.pageSelected.value == 4) {
                    return const TextX('Products');
                  } else {
                    return const TextX('Profile');
                  }
                }),
              ),
              drawer: const SideMenuView(),
              endDrawer: const SideMenuView(),
              body: Obx(() => controller.pageRoot()),
              bottomNavigationBar: Obx(() {
                if (basketController.basket.value.totalAmountSaved.toInt() !=0) {
                  int basketCounter = basketController.basket.value.productsBasket.length;
                  return myNavBar(context, controller, basketCounter);
                }
                return myNavBar(context, controller, 0);
              }),
            ),
          );
        },
      ),
    );
  }
}
