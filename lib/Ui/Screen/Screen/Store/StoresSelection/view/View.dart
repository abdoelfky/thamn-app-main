import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class StoresSelectionView extends GetView<StoresSelectionController> {
  const StoresSelectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Select the Store you want',isBack: false),
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
        return Obx(() => GridView.count(
          padding: const EdgeInsets.symmetric(
              horizontal: StyleX.hPaddingApp - 10,vertical: 10),
          crossAxisCount: 2,
          childAspectRatio: 1,
          children: controller.stores
              .map(
                (store) => GestureDetector(
              onTap: (){
                controller.selecting(store.id);
              },
              child: ContainerCardX(
                border:controller.selectedStoresIDs.contains(store.id)?Border.all(color: ColorX.primary.shade200,width: 3):null,
                margin: const EdgeInsets.all(10),
                child: ImageNetworkX(
                  imageUrl:store.logo,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          )
              .toList(),
        ),
        );
      },),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonX(onTap: controller.onTapNext, text: 'Next',marginHorizontal: StyleX.hPaddingApp),
    );
  }
}
