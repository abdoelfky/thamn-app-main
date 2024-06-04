part of data;

class SearchHistoryX {
  SearchHistoryX({
    required this.id,
    required this.name,
  });

  SearchHistoryX.empty();

  late int id;
  late String name;


  factory SearchHistoryX.fromJson(Map<String, dynamic> json) {
    return SearchHistoryX(
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
