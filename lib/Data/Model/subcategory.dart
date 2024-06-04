part of data;

class SubcategoryX {
  SubcategoryX({
    required this.id,
    required this.name,
  });

  SubcategoryX.empty();

  late int id;
  late String name;

  factory SubcategoryX.fromJson(Map<String, dynamic> json) {
    return SubcategoryX(
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
