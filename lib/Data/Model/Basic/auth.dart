part of data;

class AuthX {
  AuthX({
    required this.id,
    required this.email,
    required this.password,
  });
  AuthX.empty();

  late int id;
  late String email;
  late String password;

  factory AuthX.fromJson(Map<String, dynamic> json) {
    return AuthX(
      id: json[NameX.id]??0,
      email: json[NameX.email]??'',
      password: json[NameX.password]??''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.email: email,
      NameX.password: password,
    };
  }
}
