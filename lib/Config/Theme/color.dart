part of config;

class ColorX {
  /// Primary
  static MaterialColor primary =
      ColorHelperX.toMaterial(const Color(0xff216869));

  /// Second
  static final MaterialColor secondary =
      ColorHelperX.toMaterial(const Color(0xff49A078));

  /// Results Cases
  static final MaterialColor success =
  ColorHelperX.toMaterial(const Color(0xff70B77E));
  static final MaterialColor warning =
  ColorHelperX.toMaterial(const Color(0xffFFE2DE));
  static final MaterialColor danger =
  ColorHelperX.toMaterial(const Color(0xFFE4686F));

  /// Grey
  static const Color grey =Color(0xffF4F7F9);
  static final MaterialColor greyDark =
  ColorHelperX.toMaterial(const Color(0xffA4AEBB));

  static const Color cardDark =Color(0xff2C323B);
  /// Background
  static const Color backgroundLight = Color(0xffffffff);
  static const Color backgroundDark = Color(0xff1b222a);

  /// Gradients
  static LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primary.shade100],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
