part of data;

class VendorX {
  VendorX({
    required this.id,
    required this.name,
  });

  VendorX.empty();

  late int id;
  late String name;


  factory VendorX.fromJson(Map<String, dynamic> json) {
    return VendorX(
      id: json[NameX.id]??0,
      name: json[NameX.name]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
    };
  }
}
