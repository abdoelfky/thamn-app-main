import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';
import 'AddToCart.dart';

class ProductImageSection extends GetView<ProductDetailsController> {
  const ProductImageSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainerX(
          isBorder: true,
          borderColor: ColorX.greyDark.shade50,
          color: Colors.white,
          child: ImageNetworkX(
            imageUrl: controller.product.image,
            height: 250,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Positioned.directional(
          textDirection: DeviseX.getTextDirection,
          bottom: 12,
          end: 6,
          child: GestureDetector(
            onTap: () {
              bottomSheetX(
                child: AddToCartSection(controller.product),
              );
            },
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    color: ColorX.primary,
                    borderRadius:
                    BorderRadius.circular(50),
                ),
                child: const Icon(
                  Iconsax.shopping_cart,
                  color: Colors.white,
                ),
            ),
          ),
        )
      ],
    );
  }
}
