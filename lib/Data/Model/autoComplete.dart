part of data;

class AutoCompleteX {
  AutoCompleteX({
    required this.id,
    this.storeID,
    required this.name,
  });

  AutoCompleteX.empty();

  late int id;
  late int? storeID;
  late String name;

  factory AutoCompleteX.fromJson(Map<String, dynamic> json) {
    return AutoCompleteX(
      id: json[NameX.id]??0,
      storeID: json[NameX.storeID]??0,
      name: json[NameX.name]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.storeID: storeID,
      NameX.name: name,
    };
  }
}
