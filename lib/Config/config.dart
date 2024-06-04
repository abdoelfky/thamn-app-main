library config;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Core/core.dart';
import '../Data/data.dart';
import 'Translation/translation.dart';

part 'Theme/font.dart';
part 'Asset/image.dart';
part 'Route/routeName.dart';
part 'Theme/color.dart';
part 'Theme/textStyle.dart';
part 'Theme/theme.dart';
part 'Info/info.dart';
part 'Theme/style.dart';
part 'Asset/icon.dart';

class ConfigX{
  static init() async {
    statusBarColor(Colors.transparent);
  }

  static statusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
    ));
  }

  static deviceOrientation({bool up = true, bool down = true}) {
    SystemChrome.setPreferredOrientations([
      up ? DeviceOrientation.portraitUp : DeviceOrientation.portraitDown,
      down ? DeviceOrientation.portraitDown : DeviceOrientation.portraitUp,
    ]);
  }
}