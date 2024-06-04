import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../Core/core.dart';
import '../../../../../../../Data/data.dart';
import '../../../../../../../UI/Widget/widget.dart';

class EditProfileController extends GetxController {
  AppControllerX app =Get.find();
  final ImagePicker picker = ImagePicker();
  XFile? image;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  late TextEditingController name = TextEditingController(text: app.user.name);
  late TextEditingController phone = TextEditingController(text: app.user.phone);
  late TextEditingController birthDate = TextEditingController(text: app.user.birthDate);
  late TextEditingController address = TextEditingController(text: app.user.address);
  late String gender=app.user.gender=='f'?'Female':'Male';

  changeImage() async{
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }
  Future<void> editProfile() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      autoValidate = AutovalidateMode.always;
      try {
        AlertDialogX.loading();
        await DatabaseX.updateProfile(image: image!=null?File(image!.path):null,body: DBContactX.bodyUpdateProfile(name: name.text.trim(), email: app.user.email.trim(), gender: gender[0].toLowerCase(), birthDate: birthDate.text.trim(), address: address.text.trim())).then((value) {
          Get.back();
          app.user=value.$1;
          ToastX.success(message: value.$2);
        });
      } catch (error) {
        Get.back();
        ToastX.error(message: error);
      }
    }
  }
}