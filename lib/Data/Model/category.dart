part of data;

class CategoryX {
  CategoryX({
    required this.id,
    required this.name,
    required this.icon,
    this.subcategories=const[],
  });

  CategoryX.empty();

  late int id;
  late String name;
  late String icon;
  List<SubcategoryX> subcategories=[];


  factory CategoryX.fromJson(Map<String, dynamic> json) {
    return CategoryX(
      id: json[NameX.id]??0,
      name: json[NameX.name]??'',
      icon: json[NameX.categoryImage]??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.name: name,
      NameX.categoryImage: icon,
    };
  }
}
