import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thamn/Ui/Widget/Custom/sharingLottie.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/empty.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class StoreDetailsView extends GetView<StoreDetailsController> {
  const StoreDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: controller.store.name,isBack: true,),
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

          if (controller.flyers.isEmpty) {
            return const Center(
              child: EmptyView(),
            );
          }
          return Obx(() {
            if (controller.isSharing.value) {
              return const Center(child: SharingLottie());
            } else {
              return GridView.count(
                padding: const EdgeInsets.symmetric(
                    horizontal: StyleX.hPaddingApp - 10, vertical: 10),
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: controller.flyers
                    .map(
                      (flyer) => GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteNameX.flyerDetails,
                              arguments: [controller.store, flyer]);
                        },
                        child: ContainerCardX(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Flexible(
                                child: Center(
                                  child: ImageNetworkX(
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    imageUrl: flyer.image,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextX(flyer.name),
                              ),
                              //ToDo share Images
                              // CircleAvatar(
                              //   radius: 35.0,
                              //   backgroundColor: Colors.white,
                              //   child: IconButton(
                              //     icon: Icon(Icons.share, color: Colors.blue),
                              //     onPressed: () =>
                              //         controller.shareTextAndImages(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
          });
        },
      ),
    );
  }
}
