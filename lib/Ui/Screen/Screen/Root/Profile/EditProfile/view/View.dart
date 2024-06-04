import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../Config/config.dart';
import '../../../../../../../Core/core.dart';
import '../../../../../../Widget/widget.dart';
import '../controller/Controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarX(
        title: 'Edit Profile',
        backgroundColor: ColorX.greyDark.withOpacity(0.15),
      ),
      body: Column(
        children: [
          Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: ColorX.greyDark.withOpacity(0.15),
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(50))),
              child:  Center(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    GetBuilder<EditProfileController>(
                      builder: (controller) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: ColorX.primary, width: 3)),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: controller.app.user.image.isNotEmpty ||
                                controller.image != null
                                ? ImageNetworkX(
                                imageUrl: controller.image != null
                                    ? controller.image!.path
                                    : controller.app.user.image,
                                height: 120,
                                width: 120,
                                isFile: controller.image != null)
                                : TextX(
                              controller.app.user.name[0]
                                  .toUpperCase(),
                              style: TextStyleX.headerLarge,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -5.0,
                      bottom: -5.0,
                      child: IconButton(
                        onPressed: controller.changeImage,
                        icon: const CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: Icon(
                              Iconsax.camera,
                              color: Colors.white,
                            )),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                  horizontal: StyleX.hPaddingApp, vertical: 10),
              child: Column(
                children: [
                  Form(
                    key: controller.formKey,
                    autovalidateMode: controller.autoValidate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFieldX(
                          controller: controller.name,
                          validate: ValidateX.name,
                          hint: 'Name'.tr,
                          icon: Iconsax.user,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        DropdownX(title: 'Gender', value: controller.gender, list: const ['Male','Female'], onChanged: (val)=>controller.gender=val, icon: Iconsax.user),
                        TextFieldX(
                          controller: controller.phone,
                          validate: ValidateX.phone,
                          hint: 'Phone'.tr,
                          icon: Iconsax.call,
                          textInputType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFieldX(
                          controller: controller.address,
                          validate: ValidateX.address,
                          hint: 'address',
                          icon: Iconsax.buliding,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                        TextFieldDateX(
                          controller: controller.birthDate,
                          icon: Iconsax.calendar,
                          hint: 'Birth Date',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonX(
                    onTap: controller.editProfile,
                    text: 'Update',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
