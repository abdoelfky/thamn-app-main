part of data;

class BasketX {
  BasketX({
    required this.id,
    required this.totalPrice,
    required this.totalAmountSaved,
    required this.totalPriceByStore,
    required this.status,
    this.date,
    this.productsBasket=const[],
  });

  BasketX.empty();

  late int id;
  late String status;
  late double totalPrice;
  late double totalAmountSaved;
  late String? date;
  late Map<int,double> totalPriceByStore;
  late List<ProductBasketX> productsBasket=[];

  List<int> get getStoresIDs{
    return totalPriceByStore.keys.toSet().toList();
  }
  List<StoreX> get getStores{
    List<StoreX> stores=[];
    for(var storeID in getStoresIDs){
      stores.add(productsBasket.firstWhere((x) => x.product.storeID==storeID && x.product.store!=null).product.store!);
    }
    return stores;
  }
  List<ProductBasketX> getProductBasketByStore(id){
    return productsBasket.where((x) => x.product.storeID==id).toList();
  }

  factory BasketX.fromJson(Map<String, dynamic> json) {
    return BasketX(
      id: json[NameX.id]??0,
      status: json[NameX.status]??'',
      date: json[NameX.date],
      totalPrice: (json[NameX.totalPrice]??0)+0.0,
      totalAmountSaved: (json[NameX.totalAmountSaved]??0)+0.0,
      totalPriceByStore: ((json[NameX.totalPriceByStore]??[]).length==0?{}:json[NameX.totalPriceByStore] as Map<String, dynamic>).map<int, double>(
            (key, value) => MapEntry(int.parse(key), value.toDouble()),
      ),
      productsBasket: ((json[NameX.productsBasket]??[]).length==0?[]:json[NameX.productsBasket] as List).map((x)=>ProductBasketX.fromJson(x)).toList(),
    );
  }
}
