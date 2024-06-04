part of data;

class FlyerX {
  FlyerX({
    required this.id,
    required this.image,
    required this.name,
    required this.storeID,
  });

  FlyerX.empty();

  late int id;
  late String image;
  late String storeID;
  late String name;

  
  factory FlyerX.fromJson(Map<String, dynamic> json) {
    return FlyerX(
      id: json[NameX.id]??0,
      image: json[NameX.image]??'',
      name: json[NameX.name]??'',
      storeID: json[NameX.storeID]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.image: image,
      NameX.name: name,
      NameX.storeID: storeID,
    };
  }
}
