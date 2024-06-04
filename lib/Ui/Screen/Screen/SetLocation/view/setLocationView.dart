import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import '../controller/setLocationController.dart';
import 'package:map_location_picker/map_location_picker.dart';

class SetLocationView extends GetView<SetLocationController> {
  const SetLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMapLocationPicker(
        apiKey:"AIzaSyC0fUYASQXlqfp1d5EFSIT7_0lg0_OIxq0",
        searchHintText: 'Start typing to search'.tr ,
        currentLatLng: controller.currentLatLng,
        onNext: controller.onNext,
        // showMoreOptions: false,
        strictbounds: false,
        // showBackButton: false,
        liteModeEnabled: false,

      ),
    );
  }
}