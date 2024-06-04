part of config;

class FontX {
  /// Font Family Names
  static const ar = 'Family Arabic Name';
  static const en = 'Family English Name';

  /// Functions
  static String get fontFamily {
    switch (TranslationX.getLanguage) {
      case 'ar':
        return ar;
      case 'en':
        return en;
      default:
        return en;
    }
  }
}
