import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thamn/Ui/Screen/Screen/Root/Root/controller/Controller.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../Widget/widget.dart';
import '../../controller/Controller.dart';

class OffersBookSection extends GetView<HomeController> {
  const OffersBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.only(
          left:  StyleX.hPaddingApp - 10,right: StyleX.hPaddingApp - 10,bottom: 100),
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: controller.stores
          .map(
            (store) => GestureDetector(
          onTap: ()=>Get.toNamed(RouteNameX.storeDetails,arguments: store),
          child: ContainerCardX(
            margin: const EdgeInsets.all(10),
            child: ImageNetworkX(imageUrl: store.logo,fit: BoxFit.contain),
          ),
        ),
      )
          .toList(),
    );
  }
}
