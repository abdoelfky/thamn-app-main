part of core;

class ValidateX{

  static String? name(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z]+$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return 'Name Required'.tr;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 25) {
      return 'It must be no more than 25 characters'.tr;
    } else if (!regExp.hasMatch(value.trim())) {
      return 'It must consist of letters only'.tr;
    }
    return null;
  }

  static String? address(String? value) {
    String pattern = r'^[\u0621-\u064A\u0660\ a-zA-Z0-9]+$';
    RegExp regExp = RegExp(pattern);
    if (value!.trim().isEmpty) {
      return null;
    } else if (value.trim().length < 2) {
      return 'It must be at least two characters'.tr;
    }else if (value.trim().length > 250) {
      return 'It must be no more than 250 characters'.tr;
    } else if (!regExp.hasMatch(value.trim())) {
      return 'It must consist of letters only'.tr;
    }
    return null;
  }

  static String? phone(String? value) {
    String pattern = r'(^(?:[+0]9|00)?[0-9]{10,12}$)';
    if (value!.trim().isEmpty) {
      return null;
    }
    else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter a valid phone number'.tr;
    }
    return null;
  }

  static String? email(String? value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value!.trim().isEmpty) {
      return 'Email Required'.tr;
    }
    else if (!RegExp(pattern).hasMatch(value.trim())) {
      return 'Enter Valid Email'.tr;
    }
      return null;
  }
}