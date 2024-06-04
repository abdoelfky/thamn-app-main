import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../Config/config.dart';
import '../../../../../../EmptyState/empty.dart';
import '../../../../../../EmptyState/error.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class MyInterestsSection extends GetView<HomeController> {
  const MyInterestsSection({super.key});

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: controller.getFavoriteProducts(),
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
        if(controller.favoriteProducts.isEmpty){
          return const EmptyView();
        }
        return GridView.count(
          padding: const EdgeInsets.only(
              left:  StyleX.hPaddingApp - 10,right: StyleX.hPaddingApp - 10,bottom: 100),
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          children: controller.favoriteProducts
              .map(
                  (product) => ProductCardX(product)
          )
              .toList(),
        );
      },);
  }
}
