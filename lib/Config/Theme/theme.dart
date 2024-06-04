part of config;

class ThemeX {
  /// Function
  static ThemeMode get getTheme =>
      isDarkMode ? ThemeMode.dark : ThemeMode.light;
  static bool get isDarkMode => LocalDataX.settings.themeIsDark;
  static change(bool val) {
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  /// Theme
  static ThemeData light = ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(
        fontFamily: FontX.fontFamily,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor:ColorX.primary,
        secondary: ColorX.secondary,
        onSecondary: ColorX.secondary.shade50,
        error: ColorX.danger,
        onError: ColorX.danger.shade50,
        background: ColorX.backgroundLight,
        onBackground: Colors.white12,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorX.backgroundLight,
        shadowColor: Colors.transparent,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: ColorX.primary,unselectedItemColor: ColorX.grey),
      scaffoldBackgroundColor: ColorX.backgroundLight,
      hintColor: ColorX.greyDark,
      unselectedWidgetColor: ColorX.grey,
      canvasColor: ColorX.backgroundLight,
      drawerTheme: const DrawerThemeData(
        backgroundColor: ColorX.backgroundLight,
      ),
      cardColor: ColorX.grey
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    // textTheme: ThemeData.dark().textTheme.apply(
    //       fontFamily: FontX.fontFamily,
    //     ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor:ColorX.primary,
      primary: ColorX.primary,
      onPrimary: ColorX.primary.shade50,
      secondary: ColorX.secondary,
      onSecondary: ColorX.secondary.shade50,
      error: ColorX.danger,
      onError: ColorX.danger.shade50,
      background: ColorX.backgroundDark,
      onBackground: Colors.black12,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorX.backgroundDark,
      shadowColor: Colors.transparent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: ColorX.primary,),
    scaffoldBackgroundColor: ColorX.backgroundDark,
    hintColor: ColorX.greyDark,
    unselectedWidgetColor: ColorX.greyDark,
    canvasColor: ColorX.backgroundDark,
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorX.backgroundDark,
    ),
    cardColor: ColorX.cardDark,
  );
}
