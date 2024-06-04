import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thamn/Ui/Screen/Screen/Root/Root/controller/Controller.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../EmptyState/error.dart';
import '../../../../../Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/AppBarProduct.dart';
import 'Sections/ProductImage.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
    RootController rootController = Get.find<RootController>();

    return GetBuilder<ProductDetailsController>(builder: (controller) => Scaffold(
      key: Key(controller.id.toString()),
      appBar: const AppBarProductSection(),
      body: FutureBuilder(
        key: Key(controller.id.toString()),
        future: controller.getData(productId: rootController.productId.value),
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
          return Obx(
                () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: StyleX.hPaddingApp,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductImageSection(),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Get.toNamed(
                                RouteNameX.storeDetails,
                                arguments: controller.product.store,
                              ),
                              child: ContainerCardX(
                                height: 48,
                                width: 48,
                                radius: 50,
                                padding: const EdgeInsets.all(4),
                                child: ImageNetworkX(
                                  imageUrl:
                                  controller.product.store?.logo ?? '',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            TextX(
                              '${controller.product.quantity} ${controller.product.unit.tr}',
                              style: TextStyleX.titleSmall,
                              color: ColorX.greyDark,
                            ),
                            Row(
                              children: [
                                NumberDoubleText(
                                  controller.product.currentPrice,
                                  style: TextStyleX.titleSmall,
                                  color: ColorX.primary,
                                ),
                                TextX(
                                  ' ${controller.product.currency.tr}',
                                  style: TextStyleX.titleSmall,
                                  color: ColorX.primary,
                                ),
                              ],
                            ),
                            if (controller.isShowUnitPrice.value)
                              CardProductUnitPriceX(isBorder:true,pricePerQuantity: controller.product.pricePerQuantity, currency: controller.product.currency, unit: controller.product.unit)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (controller.genericProducts.isNotEmpty)
                              Expanded(child: const TextX('Generic Products')),
                            if (controller.genericProducts.isEmpty)
                              Expanded(child: const TextX('Comparable Products')),
                            const SizedBox(height: 10,),
                            Expanded(
                              child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextX('Show Unit Price',
                                      color: ColorX.greyDark,
                                      style: TextStyleX.titleSmall),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Switch(
                                    value: controller.isShowUnitPrice.value,
                                    onChanged: controller.changeShowUnitPrice,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        for (ProductX product
                        in controller.genericProducts)
                          ProductSuggestionsCardX(
                              product: product,
                              changeProduct: controller.changeProduct,
                              isShowUnitPrice:
                              controller.isShowUnitPrice.value),
                        if (controller.genericProducts.isNotEmpty)
                          const Padding(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: TextX('Comparable Products'),
                          )
                      ],
                    ),
                  ),
                  Obx(
                        () => SubcategoryListX(
                      subcategories: controller.vendorsSubcategories,
                      onSelected: controller.changeSelectedSubCategory,
                      selected: controller.selectedSubcategoryID.value,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: StyleX.hPaddingApp, vertical: 10),
                    child: Obx(() {
                      if (controller.isLoadingComparableProducts.isTrue) {
                        return const SizedBox(
                          height: 80,
                          child:
                          Center(child: CircularProgressIndicator(),),);
                      } else {
                        return Column(
                          children: [
                            for (ProductX product
                            in controller.comparableProducts)
                              ProductSuggestionsCardX(
                                product: product,
                                changeProduct: controller.changeProduct,
                                isShowUnitPrice:
                                controller.isShowUnitPrice.value,
                              ),
                          ],
                        );
                      }
                    },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),);
  }
}