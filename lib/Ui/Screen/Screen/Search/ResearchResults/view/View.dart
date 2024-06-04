import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Core/core.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/empty.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class ResearchResultsView extends GetView<ResearchResultsController> {
  const ResearchResultsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            DeviseX.isLTR ? Iconsax.arrow_left_2 : Iconsax.arrow_right_3,
          ),
        ),
        title: GestureDetector(
          onTap: () => Get.back(),
          child: ContainerX(
            height: 45,
            child: Row(
              children: <Widget>[
                Icon(Iconsax.search_normal_1, color: ColorX.greyDark),
                const SizedBox(
                  width: 20.0,
                ),
                TextX(
                  controller.search,
                  style: TextStyleX.titleSmall,
                  color: ColorX.greyDark,
                )
              ],
            ),
          ),
        ),
      ),
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
          return  Obx(() {
            if(controller.products.isEmpty){
              return const EmptyView();
            }else{
              return GridView.count(
                padding: const EdgeInsets.only(top: StyleX.vPaddingApp,
                    left:  StyleX.hPaddingApp - 10,right: StyleX.hPaddingApp - 10,bottom: 100),
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                children: controller.products
                    .map(
                      (product) => ProductCardX(product),
                )
                    .toList(),
              );
            }
          }
          );
        },
      ),
    );
  }
}
