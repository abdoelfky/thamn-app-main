import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thamn/Config/config.dart';

import '../../../../../../UI/Widget/widget.dart';
import '../controller/Controller.dart';

class CompletedOrdersView extends GetView<CompletedOrdersController> {
  const CompletedOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Completed Orders'),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp, vertical: StyleX.vPaddingApp),
          child: Column(
            children: [
              for (int index = 0; index < controller.orders.length; index++)
                GestureDetector(
                  onTap: () => Get.toNamed(RouteNameX.orderDetails,arguments: controller.orders[index]),
                  child: ContainerX(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: ColorX.primary, width: 1)),
                              padding: const EdgeInsets.all(3),
                              child: Icon(Icons.menu,
                                  color: ColorX.primary, size: 20),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextX(
                              '#${controller.orders[index].id}',
                              color: context.isDarkMode?Colors.white:ColorX.primary,
                              style: TextStyleX.titleSmall,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range,
                                color: ColorX.greyDark, size: 20),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 70,
                              child: TextX(controller.orders[index].date,
                                color: ColorX.greyDark,
                                style: TextStyleX.titleSmall,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ),
    );
  }
}
