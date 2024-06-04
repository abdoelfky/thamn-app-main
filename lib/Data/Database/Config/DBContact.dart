part of data;

class DBContactX{

  static const String mainAPI='https://api.thaman.info/api/';
  ////////////////////////////////////////////////////////////////////////

  /// Auth
  static const String postLoginBySocialMedia='${mainAPI}login/callback';
  static Map bodyLoginSocialMedia({required String provider,required String accessProviderToken,String? secret,AuthCredential? appleObject})=>{'provider':provider,'access_provider_token':accessProviderToken,"secret" : secret , "apple_object" : appleObject.toString()};
  static const String postLogout='${mainAPI}logout';

  ////////////////////////////////////////////////////////////////////////

  /// Profile
  static const String getProfile='${mainAPI}profile';
  static const String postUpdateProfile='${mainAPI}update-profile';
  static Map<String,String> bodyUpdateProfile({required String name,required String email,required String gender,required String birthDate,required String address})=>{NameX.name:name,NameX.email:email,NameX.gender:gender,NameX.birthDate:birthDate,NameX.address:address};
  static const String postUpdateLocationByCountry='${mainAPI}update-location';
  static const String postUpdateLocationByLatLon='${mainAPI}set-location';
  static Map bodyUpdateLocationByLatLon({required double latitude,required double longitude,required String location})=>{NameX.latitude:latitude,NameX.longitude:longitude,NameX.location:location};

  ////////////////////////////////////////////////////////////////////////

  /// Categories
  static const String getCategories='${mainAPI}list-classifications';
  static const String getCategoryDetails='${mainAPI}classification/';

  ////////////////////////////////////////////////////////////////////////

  /// Stores
  static const String getStores='${mainAPI}list-stores';
  static const String getStoreDetails='${mainAPI}store/';
  static const String getStoresByCategory='${mainAPI}stores-classifications?classifications_id[]=';
  static const String postSelectStores='${mainAPI}select-stores';
  static Map bodySelectStores({required List<int> storesIDs})=>{NameX.storesIDs:storesIDs};

  // يتم ارسال بيانات موقع المستخدم لجلب المتاجر التي على نطاق عشرة كيلو من موقع المستخدم
  static const String getStoresByLocation='${mainAPI}getStoresByLocation?latitude=-12.61278&longitude=-159.578437';

  ////////////////////////////////////////////////////////////////////////
  /// Basket
  static const String getActiveBasket='${mainAPI}cart';
  static const String getSavedBaskets='${mainAPI}saved-carts';
  static const String postChangeDoneProductInBasket='${mainAPI}item-is-done';
  static Map bodyChangeDoneProductInBasket({required int id})=>{NameX.itemID:id};
  // static const String postCheckoutActiveBasket='${mainAPI}checkout';
  static const String postSaveActiveBasket='${mainAPI}save-cart';
  static const String deleteEmptyActiveBasket='${mainAPI}cart';
  static const String deleteProductInActiveBasket='${mainAPI}cart/item/';
  static const String postReturnSaveBasketToActive='${mainAPI}saved-cart-to-active/';
    ///choose 1 for merge or 2 for replace
  static Map bodyReturnSaveBasketToActive({required int option})=>{NameX.option:option};
  static const String postAddProductToBasket='${mainAPI}cart/add/';
  static Map bodyAddProductToBasket({required int quantity,required String note})=>{NameX.quantity:quantity,NameX.description:note};

  static const String updateQuantityProductInActiveBasket='${mainAPI}cart/item/';
  static Map bodyQuantityProductInBasket({required int quantity})=>{NameX.quantity:quantity};

  ////////////////////////////////////////////////////////////////////////
  /// Products
  static const String getProducts='${mainAPI}offers-with-classification-filter';
  static const String getProductsWithSearch='${mainAPI}offers-with-classification-filter?query=';
  static const String getProductDetails='${mainAPI}offer/';
  static const String getSimilarProducts='${mainAPI}similar-offers?offer_id=';
  static const String getGenericProducts='${mainAPI}similar-offers?offer_id=';
  static String getComparableProductsForVendorID({required int vendorID,required int productID})=>'${mainAPI}similar-offers?vendor_id=$vendorID&offer_id=$productID';
  static const String getComparableProductsForAllVendors='${mainAPI}similar-offers?vendor_id=all&offer_id=';
  static const String getMostDiscountedProducts='${mainAPI}most-discounted-offers';
  static const String getProductsByCategory='${mainAPI}offers-with-classification-filter?classification_id[]=';
  static String getProductsByCategoryWithSearch({required int categoryID,required String query})=>'${mainAPI}offers-with-classification-filter?classification_id[]=$categoryID&query=$query';
  static const String getProductsByStore='${mainAPI}store-offers?stores_id[]=';

  ////////////////////////////////////////////////////////////////////////

  /// Products
  static const String getVendorsForProduct='${mainAPI}similar-offers-other-vendors?offer_id=';

  ////////////////////////////////////////////////////////////////////////

  /// Cart
  static const String postAddToCart='${mainAPI}cart/add/';

  ////////////////////////////////////////////////////////////////////////

  /// Favorites
  static const String getFavoriteProducts='${mainAPI}offers-favorites';
  static const String postAddProductToFavorite='${mainAPI}offer-favorite/';
  static const String deleteProductFromFavorite='${mainAPI}offer-unFavorite/';

  ////////////////////////////////////////////////////////////////////////

  /// Search
  static const String getSearch='${mainAPI}search';
  static const String postSearchWithCategory='${mainAPI}search-with-classifications';
  static const String getSearchAutoComplete='${mainAPI}auto-complete?query=';
  static const String getPopularSearches='${mainAPI}popular-searches';
  static const String getSearchHistory='${mainAPI}search-history';
  static const String deleteSearchHistory='${mainAPI}search-history/';

  ////////////////////////////////////////////////////////////////////////

  /// Flyers
  static const String getFlyers='${mainAPI}list-flyers';
  static const String getFlyerDetails='${mainAPI}pages-by-flyer?flyer_id[]=';
  static const String getFlyersByStore='${mainAPI}flyers-by-store?store_id[]=';

  ////////////////////////////////////////////////////////////////////////

  /// Other
  static const String getSettings='${mainAPI}settings/get?setting='; //جلب privacy , terms , call-us
  static const String getCountryWithCities='${mainAPI}country-cities'; //عرض الدول المتاحة مع المدن
  static const String getLanguages='${mainAPI}langs'; //جلب اللغات المتاحة

  ////////////////////////////////////////////////////////////////////////
}