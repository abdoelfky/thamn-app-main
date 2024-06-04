import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../../About/CallUs/view/View.dart';
import '../controller/Controller.dart';

class SideMenuView extends GetView<SideMenuController> {
  const SideMenuView(
      { Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color color =context.isDarkMode?Colors.white:ColorX.primary;
    return Drawer(
      child: Column(
        children: <Widget>[
          GetBuilder<SideMenuController>(builder: (controller) => Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorX.greyDark.withOpacity(0.15),
                  borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(30))),
              child: FittedBox(
                child: SafeArea(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: ColorX.primary, width: 3)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: ImageNetworkX(
                              key: Key(controller.app.user.image),
                              height: 120,
                              width: 120,
                              imageUrl: controller.app.user.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(RouteNameX.profile),
                          child: TextX(controller.app.user.name,
                              style: TextStyleX.headerSmall),
                        ),
                      ]),
                ),
              ),
          ),),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [const SizedBox(height: 15,),
                TextButton(
                  onPressed: () {
                    Get.toNamed(RouteNameX.settings);
                  },
                  child:  TextX('Settings',color: color),
                ),
                const Divider(endIndent: 40, indent: 40),
                TextButton(
                  onPressed: controller.editProfile,
                  child:  TextX('Edit Profile',color: color),
                ),
                const Divider(endIndent: 40, indent: 40),
                TextButton(
                  onPressed: () {
                    Get.back();
                    bottomSheetX(child: CallUsView(), title: 'Call Us'.tr);
                  },
                  child: TextX('Call Us',color: color),
                ),
                const Divider(endIndent: 40, indent: 40),
                TextButton(
                  onPressed: () async {
                    await AlertDialogX.okAndCancel(
                      title: 'Log Out',
                      message: 'Are you sure to sign out?',
                      textOK: 'Log Out',
                      colorTextOk: ColorX.danger,
                      onOk: ()async{
                        try{
                          AlertDialogX.loading();
                          await controller.app.logOut();
                        }catch(e){
                          Get.back();
                          ToastX.error(message: e);
                        }
                      },
                    );
                  },
                  child: TextX(
                    'Log Out',
                    color: ColorX.danger,
                  ),
                ),
              const SizedBox(height: 20,)
              ],),
            ),
          )
        ],
      ),
    );
  }
}
