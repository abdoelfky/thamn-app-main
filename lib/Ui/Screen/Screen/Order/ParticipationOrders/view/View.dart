import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../controller/Controller.dart';
import 'Sections/activeOrdersSection.dart';
import 'Sections/completedOrdersSection.dart';

class ParticipationOrdersView extends GetView<ParticipationOrdersController> {
  const ParticipationOrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Participation Orders'),
      body: Column(children: [
        const SizedBox(
          height: 10,
        ),
        ContainerX(
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: StyleX.hPaddingApp),
          padding: EdgeInsets.zero,
          child: TextFieldX(
            controller: controller.search,
            icon: Iconsax.search_normal,
            hint: 'Search for a order',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: SizedBox(
            height: 35.0,
            child: TabBar(
              indicatorColor: ColorX.primary,
              dividerColor: Colors.transparent,
              unselectedLabelColor: ColorX.greyDark,
              tabs: [
                Tab(text: 'Active Orders'.tr),
                Tab(text: 'Completed Orders'.tr),
              ],
              controller: controller.tabController,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            children: const [
              ActiveOrdersSection(),
              CompletedOrdersSection(),
            ],
          ),
        ),
      ]),
    );
  }
}
