import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class AppBarProductSection extends GetView<ProductDetailsController> implements PreferredSizeWidget  {
  const AppBarProductSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBarX(
      isBack: true,

        actions: [
      Obx(() {
        if (controller.doneGetData.isTrue) {
          return Row(
            children: [
              // IconButton(
              //   onPressed: () {
              //     //TODO: DB - Share Product Links
              //     //TODO: Enable Share Product
              //     bottomSheetX(
              //       title: 'Share Product',
              //       padding: EdgeInsets.zero,
              //       child: ShareProductX(
              //         product: controller.product,
              //         users: controller.users,
              //       ),
              //     );
              //   },
              //   icon: const Icon(Iconsax.share),
              // ),
              //
              // IconButton(
              //   onPressed: controller.showBasket,
              //   icon: const Icon(Iconsax.bag),
              // ),
              IconButton(
                onPressed: controller.onTapFavorite,
                icon: Icon(
                  controller.isFavorite.value
                      ? Iconsax.heart5
                      : Iconsax.heart,
                  color: controller.isFavorite.value ? ColorX.danger : null,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      })
    ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
