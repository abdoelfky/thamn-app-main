import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../Config/config.dart';
import '../../../../Widget/widget.dart';
import '../controller/Controller.dart';


class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(title: 'Settings'.tr),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SettingCardX(
                title: 'Language',
                icon: Iconsax.translate,
                child: LanguageButtonX(),
              ),
              SettingCardX(
                title: 'Theme',
                icon: Iconsax.moon,
                onTap: controller.changeTheme,
                child: Obx(
                      () => Switch(
                    value: controller.themeIsDark.value,
                    onChanged: (_) {
                      controller.changeTheme();
                    },
                  ),
                ),
              ),
              SettingCardX(
                title: 'Privacy Policy',
                icon: Iconsax.lock,
                onTap: ()=>Get.toNamed(RouteNameX.privacyPolicy),
              ),
              SettingCardX(
                title: 'Terms Of Service',
                icon: Iconsax.profile_2user,
                onTap: ()=>Get.toNamed(RouteNameX.termsOfService),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
