part of core;

class DeviseX{
  static bool get isLTR => Directionality.of(Get.context!) == TextDirection.ltr;
  static TextDirection get getTextDirection => Directionality.of(Get.context!);

  /// Size
  static double width(context) => MediaQuery.of(context).size.width;
  static double height(context) => MediaQuery.of(context).size.height;
  static double heightSafe(context) => height(context)-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.bottom;

  static SizeType size(BuildContext context){
    if (width(context) < 600) {
      return SizeType.small;
    } else if (width(context) < 1024) {
      return SizeType.medium;
    } else{
      return SizeType.large;
    }
  }

  /// Type
  static DeviceType get type {
    if (kIsWeb) {
      return DeviceType.web;
    } else if (MediaQuery.of(Get.context!).size.width < 600) {
      return DeviceType.mobile;
    } else if (MediaQuery.of(Get.context!).size.width >= 600 && MediaQuery.of(Get.context!).size.width <= 1024) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  /// Platform
  static PlatformType get platform {
    if (kIsWeb) {
      return PlatformType.web;
    } else if (Platform.isAndroid) {
      return PlatformType.android;
    } else if (Platform.isIOS) {
      return PlatformType.ios;
    } else if (Platform.isMacOS) {
      return PlatformType.mac;
    } else if (Platform.isWindows) {
      return PlatformType.windows;
    } else if (Platform.isLinux) {
      return PlatformType.linux;
    } else {
      return PlatformType.fuchsia;
    }
  }
}