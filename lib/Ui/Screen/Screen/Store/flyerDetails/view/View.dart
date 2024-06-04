import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';
import 'Sections/imagesBarSection.dart';

class FlyerDetailsView extends GetView<FlyerDetailsController> {
  const FlyerDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: controller.store.name),
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  onPageChanged: controller.changeFlyerPage,
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  children: [
                    for (int index = 0;
                        index < controller.flyerPages.length;
                        index++)
                      SizedBox(
                        height: double.infinity,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(StyleX.radius),
                            child: Stack(
                              children: [
                                ImageNetworkX(
                                    imageUrl:
                                        controller.flyerPages[index].image,
                                    fit: BoxFit.fitWidth),
                                for (ProductX product
                                    in controller.flyerPages[index].products)
                                  Positioned.directional(
                                      textDirection: TextDirection.ltr,
                                      top: controller
                                          .convertImageSizeToMobileSize(
                                              flyerPage:
                                                  controller.flyerPages[index],
                                              size: product.imageY),
                                      start: controller
                                          .convertImageSizeToMobileSize(
                                              flyerPage:
                                                  controller.flyerPages[index],
                                              size: product.imageX),
                                      child: GestureDetector(
                                          onTap: () => Get.toNamed(
                                              RouteNameX.productDetails,
                                              arguments: product.id),
                                          child: Container(
                                            color: Colors.black12,
                                            width: controller
                                                .convertImageSizeToMobileSize(
                                                    flyerPage: controller
                                                        .flyerPages[index],
                                                    size: product.imageWidth),
                                            height: controller
                                                .convertImageSizeToMobileSize(
                                                    flyerPage: controller
                                                        .flyerPages[index],
                                                    size: product.imageHeight),
                                          )))
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const ImagesBarSection(),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
