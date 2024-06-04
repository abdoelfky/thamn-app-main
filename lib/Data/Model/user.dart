part of data;

class UserX {
  UserX({
    required this.name,
    required this.email,
    required this.gender,
    required this.birthDate,
    required this.phone,
    required this.image,
    required this.address,
    required this.location,
    required this.latitude,
    required this.longitude,
    this.token='',
    this.isOnline=false,
    this.lastSeen=1,
  });

  UserX.empty({
    this.name='',
     this.email='',
     this.gender='',
     this.birthDate='',
     this.phone='',
     this.image='',
     this.address='',
    this.token='',
    this.isOnline=false,
    this.lastSeen=1,
  });

  late String name;
  late String email;
  late String gender;
  late String birthDate;
  late String address;
  late String phone;
  late String image;
  late String token;
  late String location;
  late double latitude;
  late double longitude;
  late bool isOnline;
  late int lastSeen;

  factory UserX.fromJson(Map<String, dynamic> json,String? token) {
    return UserX(
      token: token??json[NameX.token]??'',
      name: json[NameX.name]??'',
      email: json[NameX.email]??'',
      gender: json[NameX.gender]??'',
      birthDate: json[NameX.birthDate]??'',
      address: json[NameX.address]??'',
      image: json[NameX.imageUser]??'',

      location: json[NameX.location]??'',
      latitude: double.parse(json[NameX.latitude]??'0.0'),
      longitude: double.parse(json[NameX.longitude]??'0.0'),

      phone: json[NameX.phone]??'',
      isOnline: json[NameX.isOnline]??false,
      lastSeen: json[NameX.lastSeen]??1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.name: name,
      NameX.image: image,
      NameX.email: email,
      NameX.phone: phone,
      NameX.isOnline: isOnline,
      NameX.lastSeen: lastSeen,
    };
  }
}
