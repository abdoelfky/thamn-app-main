import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/empty.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class SavedBasketsView extends GetView<SavedBasketsController> {
  const SavedBasketsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Saved Baskets'),
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
          if (controller.savedBaskets.isEmpty) {
            return const Center(
              child: EmptyView(),
            );
          }
          return ListView(
            children: [
              for (BasketX basket in controller.savedBaskets)
                InkWell(
                  onTap: ()=>Get.toNamed(RouteNameX.savedBasketDetails,arguments: basket),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: ColorX.primary, width: 2)),
                                  padding: const EdgeInsets.all(3),
                                  margin:
                                  const EdgeInsets.only(top: 6, left: 6),
                                  child: Icon(Icons.menu,
                                      color: ColorX.primary, size: 20),
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorX.primary,
                                      child: TextX(
                                        basket.productsBasket.length.toString(),
                                        color: Colors.white,
                                        style: TextStyleX.titleSmall,
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextX(
                              basket.date ?? 'Date unknown',
                              color: ColorX.greyDark,
                              style: TextStyleX.titleSmall,
                            )
                          ],
                        ),
                        ContainerX(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          isBorder: true,
                          borderColor: ColorX.primary,
                          color: Colors.transparent,
                          child: TextX(
                            'Shopping',
                            style: TextStyleX.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
