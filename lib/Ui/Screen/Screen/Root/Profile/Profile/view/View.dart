import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../../../../../Basic/About/CallUs/view/View.dart';
import '../controller/Controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GetBuilder<AppControllerX>(
          builder: (controller) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: ColorX.primary, width: 3)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: ImageNetworkX(
                  key: Key(controller.user.image),
                  height: 120,
                  width: 120,
                  imageUrl: controller.user.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextX(
              controller.user.name,
              style: TextStyleX.titleMedium,
            ),
            TextX(
              controller.user.email,
              style: TextStyleX.titleMedium,
              color: ColorX.greyDark,
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: controller.setLocation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.location,
                      color:
                          context.isDarkMode ? Colors.white : ColorX.primary),
                  const SizedBox(
                    width: 5,
                  ),
                  if (controller.locationIsNotEmpty)
                    SizedBox(
                      width: Get.width / 2,
                      child: TextX(
                        controller.locationName,
                        maxLines: 1,
                        color:
                            context.isDarkMode ? Colors.white : ColorX.primary,
                        style: TextStyleX.titleSmall,
                      ),
                    ),
                  if (!controller.locationIsNotEmpty)
                    TextX(
                      'Set your location',
                      color: context.isDarkMode ? Colors.white : ColorX.primary,
                      style: TextStyleX.titleSmall,
                    ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
                // horizontal: StyleX.hPaddingApp,
                vertical: 10),
            child: GetBuilder<ProfileController>(
              builder: (controller) => Column(
                children: [
                  SettingCardX(
                    onTap: () => Get.toNamed(RouteNameX.savedBaskets),
                    title: 'Saved Baskets',
                    icon: Iconsax.bag,
                  ),
                  SettingCardX(
                    onTap: () => Get.toNamed(RouteNameX.editProfile),
                    title: 'Edit Profile',
                    icon: Iconsax.user_edit,
                  ),
                  SettingCardX(
                    onTap: () => Get.toNamed(RouteNameX.settings),
                    title: 'Settings',
                    icon: Iconsax.setting,
                  ),
                  // SettingCardX(
                  //     onTap: () => Get.toNamed(RouteNameX.completedOrders),
                  //     title: 'Completed orders',
                  //     icon: Iconsax.bag_tick),
                  // SettingCardX(
                  //     onTap: () => Get.toNamed(RouteNameX.participationOrders),
                  //     title: 'Participation Orders',
                  //     icon: Iconsax.bag_happy),
                  SettingCardX(
                      onTap: () => bottomSheetX(
                          child: CallUsView(), title: 'Call Us'.tr),
                      title: 'Call Us',
                      icon: Iconsax.call),
                  SettingCardX(
                      onTap: () async => await controller.shareText(
                          'https://play.google.com/store/apps/details?id=com.thamn'),
                      title: 'Share The Application',
                      icon: Iconsax.share),
                  SettingCardX(
                    onTap: () async {
                      await AlertDialogX.okAndCancel(
                        title: 'Log Out',
                        message: 'Are you sure to sign out?',
                        textOK: 'Log Out',
                        colorTextOk: ColorX.danger,
                        onOk: () async {
                          try {
                            AlertDialogX.loading();
                            await controller.app.logOut();
                          } catch (e) {
                            Get.back();
                            ToastX.error(message: e);
                          }
                        },
                      );
                    },
                    title: 'Log Out',
                    icon: Iconsax.logout,
                    isDanger: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
