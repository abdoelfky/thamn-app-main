part of data;

class ProductX {
  ProductX({
    required this.id,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.previousPrice,
    required this.amountSaved,
    required this.discount,
    required this.validTo,
    required this.quantity,
    required this.unit,
    required this.storeID,
    required this.currency,
    required this.pricePerQuantity,
    required this.imageHeight,
    required this.imageWidth,
    required this.imageX,
    required this.imageY,
    required this.vendorID,
    required this.vendorName,
    this.description,
    this.isFavorite=false,
    this.store,
  });

  ProductX.empty();

  late int id;
  late String name;
  late String? description;
  late double currentPrice;
  late double previousPrice;
  late double amountSaved;
  late String validTo;
  late String currency;
  late double pricePerQuantity;
  late String image;
  late double discount;
  late int quantity;
  late String unit;

  late bool isFavorite;

  late int vendorID;
  late String vendorName;

  late int storeID;
  StoreX? store;

  late int imageHeight;
  late int imageWidth;
  late int imageX;
  late int imageY;

  factory ProductX.fromJson(Map<String, dynamic> json, {bool isFavorite=false}) {
    if(json[NameX.imageProduct] is String){
      json[NameX.imageProduct]={};
    }
    return ProductX(
      id: json[NameX.id]??0,
      name: json[NameX.name]??'',
      currentPrice:(json[NameX.currentPrice]??0)+0.0,
      previousPrice:(json[NameX.previousPrice]??0)+0.0,
      amountSaved:(json[NameX.amountSaved]??0)+0.0,
      validTo: json[NameX.validTo]??'',
      currency: json[NameX.currency]??'',
      quantity:(json[NameX.quantity]??0).toInt(),
      discount:(json[NameX.discount]??0)+0.0,
      description: json[NameX.description]??'',
      pricePerQuantity: (json[NameX.pricePerQuantity]??0)+0.0,
      unit: json[NameX.unit]??'',
      isFavorite:isFavorite,
      vendorID:json[NameX.vendor]?[NameX.id]??0,
      vendorName: json[NameX.vendor]?[NameX.name]??'',

      image: json[NameX.productImage]??'',
      imageX:json[NameX.imageProduct]?[NameX.xStart]??0,
      imageY:json[NameX.imageProduct]?[NameX.yStart]??0,
      imageHeight:(json[NameX.imageProduct]?[NameX.yEnd]??0)-(json[NameX.imageProduct]?[NameX.yStart]??0),
      imageWidth:(json[NameX.imageProduct]?[NameX.xEnd]??0)-(json[NameX.imageProduct]?[NameX.xStart]??0),
      storeID: (json[NameX.store]?[NameX.id])??0,
      store: StoreX.fromJson(json[NameX.store]??{}),
    );
  }
}
