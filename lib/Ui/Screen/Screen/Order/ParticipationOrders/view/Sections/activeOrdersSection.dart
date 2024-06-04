import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../../Data/data.dart';
import '../../../../../../../UI/Widget/widget.dart';
import '../../controller/Controller.dart';

class ActiveOrdersSection extends GetView<ParticipationOrdersController> {
  const ActiveOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
          horizontal: StyleX.hPaddingApp,
          vertical: StyleX.vPaddingApp),
      child: Column(
        children: [
          ...controller.participationOrders
              .where((x) => x.completionDate.isEmpty)
              .map(
                  (data) {
                UserX user=controller.getUser(data.userID);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: GestureDetector(
                    onTap: () => Get.toNamed(RouteNameX.orderTracking,arguments: data.orderID),
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: user.isOnline?ColorX.success:ColorX.greyDark,
                              ),
                              const SizedBox(width: 10,),
                              ClipRRect(borderRadius: BorderRadius.circular(50),child: ImageNetworkX(height: 45,width: 45,imageUrl: user.image),),
                              const SizedBox(width: 15,),
                              TextX(user.name,)
                            ],
                          ),
                          TextX(FunctionX.formatTimeSeconds(user.lastSeen),style: TextStyleX.titleSmall,color: ColorX.greyDark,)
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}
