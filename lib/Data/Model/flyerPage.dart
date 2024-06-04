part of data;

class FlyerPageX {
  FlyerPageX({
    required this.id,
    required this.flyerID,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    this.products = const [],
  });

  FlyerPageX.empty();

  late int id;
  late int flyerID;
  late double imageHeight;
  late double imageWidth;
  late String image;
  List<ProductX> products=[];


  
  factory FlyerPageX.fromJson(Map<String, dynamic> json) {
    return FlyerPageX(
      id: json[NameX.id]??0,
      flyerID: json[NameX.flyerID]??0,
      image: json[NameX.image]??'',
      imageHeight:json[NameX.imageHeight]+0.0??0.0,
      imageWidth:json[NameX.imageWidth]+0.0??0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      NameX.id: id,
      NameX.image: image,
      NameX.flyerID: flyerID,
      NameX.imageHeight: imageHeight,
      NameX.imageWidth: imageWidth,
    };
  }
}
