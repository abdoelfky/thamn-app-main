part of data;

class OrderX {
  OrderX({
    required this.id,
    required this.date,
    required this.doneProductsIDs,
    required this.canceledProductsIDs,
    required this.shareWith,
  });

  OrderX.empty();

  late int id;
  late String date;
  List<String> doneProductsIDs=[];
  List<String> canceledProductsIDs=[];
  late String shareWith;

  factory OrderX.fromJson(Map<String, dynamic> json) {
    return OrderX(
      id: json[NameX.id]??0,
      date: json[NameX.date]??'',
      shareWith: json[NameX.shareWith]??'',
      doneProductsIDs: List<String>.from(json[NameX.doneProductsIDs]??[]),
      canceledProductsIDs: List<String>.from(json[NameX.canceledProductsIDs]??[]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.date: date,
      NameX.shareWith: shareWith,
      NameX.doneProductsIDs: doneProductsIDs,
      NameX.canceledProductsIDs: canceledProductsIDs,
    };
  }
}
