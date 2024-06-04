import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Controller.dart';

class CategoriesSection extends GetView<ResearchResultsController> {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return const Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Column(
          children: [
            // CategoriesListX(
            //   categories: controller.categories,
            //   onSelected: controller.changeSelectedCategory,
            //   selected: controller.selectedCategoryID.value,
            // ),
            // if(controller.selectedCategoryID.value!=0)
            //   Padding(
            //     padding: const EdgeInsets.only(top: 15.0),
            //     child: SubcategoryListX(subcategories: controller.getSubcategories, onSelected: controller.changeSelectedSubCategory, selected: controller.selectedSubcategoryID.value),
            //   ),
          ],
        ),
      );
    });
  }
}
