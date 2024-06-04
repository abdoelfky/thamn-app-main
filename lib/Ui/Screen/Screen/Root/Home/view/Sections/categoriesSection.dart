import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Animation/sizeAnimation.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class CategoriesSection extends GetView<HomeController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizeAnimationX(
        delay: 0.5,
        child: controller.isProductsTap.value
            ? Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: [
              CategoriesListX(
                categories: controller.categories,
                onSelected: controller.changeSelectedCategory,
                selected: controller.selectedCategoryID.value,
              ),
              if(controller.selectedCategoryID.value!=0)
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SubcategoryListX(subcategories: controller.getSubcategories, onSelected: controller.changeSelectedSubCategory, selected: controller.selectedSubcategoryID.value),
                ),
            ],
          ),
        )
            : const SizedBox(width: double.infinity),
      );
    });
  }
}
