import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thamn/Core/core.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class ImagesBarSection extends GetView<FlyerDetailsController> {
  const ImagesBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: StyleX.hPaddingApp,
          ),
          child: Row(
            children: [
              for (int index = 0;
                  index < controller.flyerPages.length;
                  index++)
                GestureDetector(
                  onTap: () {
                    controller
                        .changeFlyerPage(index);
                  },
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 10),
                    child: Container(
                        padding: controller.selectedFlyerPageIndex.value == index
                            ? const EdgeInsets.all(6)
                            : null,
                        decoration: BoxDecoration(
                            border:
                                controller.selectedFlyerPageIndex.value == index
                                    ? Border.all(
                                        color: ColorX.primary.shade200,
                                        width: 2)
                                    : null,
                            borderRadius:
                                controller.selectedFlyerPageIndex.value == index
                                    ? BorderRadius.circular(6)
                                    : null),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: ImageNetworkX(
                                    height: 70,
                                    width: 50,
                                    imageUrl: controller
                                        .flyerPages[index].image)),
                            Positioned.directional(
                              textDirection: DeviseX.getTextDirection,
                              top: 3,
                                start: 3,
                                child:  CircleAvatar(
                              backgroundColor: Colors.black54,
                              radius: 9,
                                  child: Center(child: TextX((index+1).toString(),style: TextStyleX.titleSmall,color: Colors.white,)),
                            ),
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}
