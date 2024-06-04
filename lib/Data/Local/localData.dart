part of data;

class LocalDataX {
  static late String route;
  static late SettingsX settings;
  static String get token => get(LocalNames.token, '');

  /// Notifications
  static late int unreadNotifications;
  static late List<NotificationX> allNotifications;

  static Future<void> initialize() async {
    if (kIsWeb) {
      settings = SettingsX.fromJson(Map<String, dynamic>.from(json.decode(get(
          LocalNames.settings,
          json.encode(LocalDefaultDataX.settings.toJson())))));
      allNotifications = List<NotificationX>.from(
          json.decode(get(LocalNames.allNotifications, json.encode(LocalDefaultDataX.allNotifications)))
              .map((json) => NotificationX.fromJson(json)));
      unreadNotifications = int.parse(get(LocalNames.unreadNotifications,
          LocalDefaultDataX.unreadNotifications.toString())
          .toString());
    } else {
      await HiveX.initialize();
      settings = SettingsX.fromJson(
          get(LocalNames.settings, LocalDefaultDataX.settings.toJson()));
      allNotifications = List<NotificationX>.from(
          get(LocalNames.allNotifications, LocalDefaultDataX.allNotifications)
              .map((json) => NotificationX.fromJson(json)));
      unreadNotifications = get(LocalNames.unreadNotifications,
          LocalDefaultDataX.unreadNotifications);
    }

    route = get(LocalNames.route, LocalDefaultDataX.route);
  }

  static remove(String kay) {
    if (kIsWeb) {
      CookieX.remove(kay);
    } else {
      HiveX.remove(kay);
    }
  }

  static get(String kay, var defaultData) {
    if (kIsWeb) {
      return CookieX.get(kay, defaultValue: defaultData);
    } else {
      return HiveX.get(kay, defaultValue: defaultData);
    }
  }

  static put(String kay, data) {
    if (kIsWeb) {
      CookieX.put(value: data, key: kay);
    } else {
      HiveX.put(val: data, kay: kay);
    }
  }
}
