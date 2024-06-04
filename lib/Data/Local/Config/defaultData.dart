part of data;

class LocalDefaultDataX{
  static SettingsX settings= SettingsX(
    language: Get.deviceLocale?.languageCode ?? 'ar',
    themeIsDark: Get.isPlatformDarkMode,
  );
  static String route=RouteNameX.login;
  static String token='';
  static int unreadNotifications=0;
  static List<Map<String,dynamic>> allNotifications=[];
}
