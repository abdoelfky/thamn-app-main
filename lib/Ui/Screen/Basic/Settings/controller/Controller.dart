import 'package:get/get.dart';

import '../../../../../Config/Translation/translation.dart';
import '../../../../../Config/config.dart';
import '../../../../../Data/data.dart';
import '../../../../Widget/widget.dart';

class SettingsController extends GetxController {
  RxBool themeIsDark = ThemeX.isDarkMode.obs;

  changeLanguage(String val) async {
    try {
      await TranslationX.changeLocale(val);
      LocalDataX.settings.language = val;
      LocalDataX.put(LocalNames.settings, LocalDataX.settings.toJson());
      Get.back();
    } catch (e) {
      ToastX.error(message: e.toString());
    }
  }

  changeTheme() async {
    try {
      themeIsDark.value = !themeIsDark.value;
      LocalDataX.settings.themeIsDark = themeIsDark.value;
      ThemeX.change(themeIsDark.value);
      LocalDataX.put(LocalNames.settings, LocalDataX.settings.toJson());
    } catch (e) {
      ToastX.error(message: e.toString());
    }
  }
}