part of data;

class StoreX {
  StoreX({
    required this.id,
    required this.logo,
    required this.name,
  });

  StoreX.empty();

  late int id;
  late String name;
  late String logo;

  factory StoreX.fromJson(Map<String, dynamic> json) {
    return StoreX(
      id: json[NameX.id]??0,
      name: json[NameX.name]??'',
      logo: json[NameX.logo]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.logo: logo,
    };
  }
}
