library core;

import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' as intl;
import 'package:map_location_picker/map_location_picker.dart';
import '../Config/config.dart';
import '../Data/data.dart';
import '../UI/Widget/widget.dart';
import '../Ui/EmptyState/systemCrash.dart';

part 'Util/function.dart';
part 'Helper/encryption.dart';
part 'Helper/localNotification.dart';
part 'Controller/appController.dart';
part 'Helper/catchError.dart';
part 'Helper/color.dart';
part 'Helper/devise.dart';
part 'Util/validate.dart';
part 'Helper/geolocation.dart';

class CoreX{
  static init() async{
    await LocalNotificationX.init();
    CatchErrorX.systemCrash();
  }
}
