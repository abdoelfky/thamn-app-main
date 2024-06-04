import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../UI/Widget/widget.dart';
import '../../../../../EmptyState/error.dart';
import '../controller/Controller.dart';

class CallUsView extends StatelessWidget {
   CallUsView({Key? key}) : super(key: key){
     controller=Get.put(CallUsController());
   }
   late CallUsController controller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(height: 130,child: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError) {
          return Center(
            child: SizedBox(
              height: 200,
              child: ErrorView(
                error: snapshot.error.toString(),
              ),
            ),
          );
        }
      return Column(children: [
        InkWell(
          onTap: ()=> controller.sendEmail('السلام عليكم من تطبيق ثمن'),
          child: ContainerX(
            padding: const EdgeInsets.all(15),
            color: ColorX.greyDark.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [
              const Icon(Iconsax.sms,),
              const SizedBox(width: 10,),
              TextX(controller.callUsEmail,)
            ],),),
        ),
        InkWell(
          onTap: ()=> controller.makePhoneCall(),
          child: ContainerX(
            padding: const EdgeInsets.all(15),
            color: ColorX.greyDark.withOpacity(0.1),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [
              const Icon(Iconsax.call,),
              const SizedBox(width: 10,),
              TextX(controller.callUsPhone,)
            ],),),
        ),
      ]);
    },);
  }
}
