import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class MostDiscountedSection extends GetView<HomeController> {
  const MostDiscountedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(
          left:  StyleX.hPaddingApp - 10,right: StyleX.hPaddingApp - 10,bottom: 100),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      children: controller.mostOffersProducts
          .map(
            (product) => ProductCardX(product)
      )
          .toList(),
    );
  }
}
