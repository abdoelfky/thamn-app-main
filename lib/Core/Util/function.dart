part of core;

class FunctionX {
  static String formatTimeSeconds(int val) {
    String result = '';
    if (val >= 86400) {
      result = '${(val / 86400).floor()} ${'day'.tr}';
    } else if (val >= 3600) {
      result = '${(val / 3600).floor()}${'h'.tr}';
      if (val % 3600 != 0) {
        result += ' : ${val % 3600}${'m'.tr}';
      }
    } else if (val >= 60) {
      result = '${(val / 60).floor()}${'m'.tr}';
      if (val % 60 != 0) {
        result += ' : ${val % 60}${'s'.tr}';
      }
    } else {
      result = ('$val ${'s'.tr}');
    }
    return result;
  }
}
