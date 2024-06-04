import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../EmptyState/empty.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class ProductsSection extends GetView<HomeController> {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.isLoadingGetAllProducts.isTrue){
        return const Center(child: CircularProgressIndicator());
      }else if(controller.products.isEmpty){
        return const EmptyView();
      }else{
        return GridView.count(
          padding: const EdgeInsets.only(
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
  }
}
