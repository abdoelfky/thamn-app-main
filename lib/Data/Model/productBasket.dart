part of data;

class ProductBasketX {
  ProductBasketX({
    required this.id,
    required this.cartID,
    required this.productID,
    required this.quantity,
    this.isDone=false,
    this.note='',
    ProductX? product,
  }){
    this.product=product??ProductX.empty();
  }

  ProductBasketX.empty();

  late int id;
  late int cartID;
  late int productID;
  late int quantity;
  late bool isDone;
  late String note;
  late ProductX product;

  factory ProductBasketX.fromJson(Map<String, dynamic> json, {bool isFavorite=false}) {
    return ProductBasketX(
      id: json[NameX.id]??0,
      cartID: json[NameX.cartID]??0,
      productID: json[NameX.productID]??0,
      quantity:(json[NameX.quantity]??0).toInt(),
      isDone: json[NameX.isDone]??false,
      note: json[NameX.description]??'',
      product: ProductX.fromJson(json[NameX.product]??{}),
    );
  }

}
