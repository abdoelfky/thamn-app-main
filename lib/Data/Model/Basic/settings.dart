part of data;

class SettingsX {
  SettingsX({
    required this.language,
    required this.themeIsDark,
  });
  late String language;
  late bool themeIsDark;

  factory SettingsX.fromJson(Map<dynamic, dynamic> json) {
    return SettingsX(
      language: json['language'],
      themeIsDark: json['theme'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'theme': themeIsDark,
    };
  }
}
