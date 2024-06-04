part of data;

class DatabaseX {
  static initialize() async {
    try {
      await FirebaseX.init();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  ///=======================================================================================
  /// Auth

  static Future<(UserX,bool)> loginBySocialMedia({required String provider, required String accessProviderToken,String? secret , AuthCredential? appleObject}) async {
    try {
      print(DBContactX.bodyLoginSocialMedia(provider: provider, accessProviderToken: accessProviderToken,secret: secret));
      var data = await ApiX.post(DBContactX.postLoginBySocialMedia,body: DBContactX.bodyLoginSocialMedia(provider: provider, accessProviderToken: accessProviderToken,secret: secret));
      if(data[NameX.data]!=null && data[NameX.data][NameX.user]!=null && data[NameX.data][NameX.token]!=null){
      return (UserX.fromJson(data[NameX.data][NameX.user],data[NameX.data][NameX.token]),(data[NameX.isSignUp]??false)as bool);
      }else{
        return Future.error('error');
      }
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  static Future logout() async {
    try {
      await FirebaseX.logout();
      return (await ApiX.post(DBContactX.postLogout,token: LocalDataX.token))?[NameX.message]??'';
    } catch (error) {
      if(error=='Not authenticated'){
        return null;
      }
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  ///=======================================================================================
  /// Get

  static Future<List<T>> getAll<T>({required api,required Function(Map<String, dynamic>) fromJson}) async {
    try {
      var x = await ApiX.get(api,token: LocalDataX.token);
      List<T> objects=[];
      for(var obj in x[NameX.data]??[]) {
        objects.add(fromJson(obj));
      }
      return objects;
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<List<String>> getSearchHistory() async {
    try {
      var x = await ApiX.get(DBContactX.getSearchHistory,token: LocalDataX.token);
      return List<String>.from(x[NameX.searchHistory]??[]);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  static Future<List<String>> getPopularSearches() async {
    try {
      var x = await ApiX.get(DBContactX.getPopularSearches,token: LocalDataX.token);
      return List<String>.from(x[NameX.popularSearches]??[]);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<String> getPrivacy() async {
    try {
      return (await ApiX.get(DBContactX.getSettings+NameX.privacy,token: LocalDataX.token))[NameX.privacy]??'';
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<String> getTerms() async {
    try {
      return (await ApiX.get(DBContactX.getSettings+NameX.terms,token: LocalDataX.token))[NameX.terms]??'';
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  // static Future<String> getListString() async {
  //   try {
  //     return (await ApiX.get(DBContactX.getSettings+NameX.terms,token: LocalDataX.token))[NameX.terms]??'';
  //   } catch (error) {
  //     CatchErrorX.console(error);
  //     return Future.error(error);
  //   }
  // }
  static Future<(String,String)> getCallUs() async {
    try {
      var x =await ApiX.get(DBContactX.getSettings+NameX.callUs,token: LocalDataX.token);
      return ((x[NameX.callUsEmail]??'') as String,(x[NameX.callUsPhone] ??'') as String);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  static Future<List<T>> getAllByID<T>({required int id,required api,required Function(Map<String, dynamic>) fromJson}) async {
    try {
      return await getAll<T>(api: api+id.toString(), fromJson: fromJson);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<T> getObject<T>({int? id,required api,required Function(Map<String, dynamic>) fromJson}) async {
    try {
      api+=id!=null?id.toString():'';
      return fromJson((await ApiX.get(api,token: LocalDataX.token))[NameX.data]??{});
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<ProductX> getProduct({required id}) async {
    try {
      var x =await ApiX.get(DBContactX.getProductDetails+id.toString(),token: LocalDataX.token);
      return ProductX.fromJson(x[NameX.data]??{},isFavorite: x[NameX.isFavorite]??false);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future<UserX> getProfile() async {
    try {
      return UserX.fromJson((await ApiX.get(DBContactX.getProfile,token: LocalDataX.token))[NameX.data]?[NameX.profile]??{},LocalDataX.token);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static getFlyerPages({required int id}) async {
    try {
      var x = await ApiX.get(DBContactX.getFlyerDetails+id.toString(),token: LocalDataX.token);
      List<FlyerPageX> flyerPages=[];
      for(var x in x[NameX.data]??[]) {
        FlyerPageX flyerPage=FlyerPageX.fromJson(x);
        List<ProductX> products=[];
        for(var product in x[NameX.flyerPagesProducts]) {
          products.add(ProductX.fromJson(product));
        }
        flyerPage.products=products;
        flyerPages.add(flyerPage);
      }
      return flyerPages;
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static getSimilarProductsForAllVendors({required int id}) async {
    try {
      var x = await ApiX.get(DBContactX.getComparableProductsForAllVendors+id.toString(),token: LocalDataX.token);
      List<ProductX> products=[];
        for(var product in x[NameX.data]??[]) {
          ProductX prod=ProductX.fromJson(product);
          products.add(prod);
      }
      return products;
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  // static getSimilarProducts({required int id}) async {
  //   try {
  //     print(DBContactX.getSimilarProducts+id.toString());
  //     var x = await ApiX.get(DBContactX.getSimilarProducts+id.toString());
  //     List<ProductX> products=[];
  //     for(var data in x[NameX.data]??[]) {
  //       StoreX store=StoreX.fromJson(data);
  //       for(var product in data[NameX.products]??[]) {
  //         ProductX prod=ProductX.fromJson(product);
  //         prod.store=store;
  //         prod.storeID=store.id;
  //         products.add(prod);
  //       }
  //     }
  //     return products;
  //   } catch (error) {
  //     CatchErrorX.console(error);
  //     return Future.error(error);
  //   }
  // }
  static getCategories() async {
    try {
      var x = await ApiX.get(DBContactX.getCategories,token: LocalDataX.token);
      List<CategoryX> categories=[];
      for(var category in x[NameX.data]??[]) {
        CategoryX cate=CategoryX.fromJson(category);
        List<SubcategoryX> sub=[];
        for(var subcategory in category[NameX.subcategories]) {
          sub.add(SubcategoryX.fromJson(subcategory));
        }
        cate.subcategories=sub;
        categories.add(cate);
      }
      return categories;
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  ///=======================================================================================
  /// Add
  ///
  static Future addProductToFavorite({required int id}) async {
    try {
      return await ApiX.post(DBContactX.postAddProductToFavorite+id.toString(),token: LocalDataX.token);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future postObject({int? id,required api,Object? body}) async {
    try {
      api+=id!=null?id.toString():'';
      return await ApiX.post(api,token: LocalDataX.token,body: body);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }

  ///=======================================================================================
  /// Update

  static Future<(UserX,String)> updateProfile({required Map<String, String> body,File? image}) async {
    try {
      late Map result;
      if(image!=null){
        result= await ApiX.postImage(DBContactX.postUpdateProfile,image: image,filename: NameX.imageUser,body: body,token: LocalDataX.token);
      }else {
        result= await ApiX.post(DBContactX.postUpdateProfile,body:body,token: LocalDataX.token);
      }
      return (UserX.fromJson(result[NameX.data][NameX.user], LocalDataX.token),(result[NameX.message]??'').toString());
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future updateObject({int? id,required String api, required Map body}) async {
    try {
      api+=id!=null?id.toString():'';
      return await ApiX.post(api,body:body,token: LocalDataX.token);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }


  ///=======================================================================================
  /// Delete
  static Future removeObjectByID({required String api,required int id}) async {
    try {
      return await ApiX.delete(api+id.toString(),token: LocalDataX.token);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
  static Future deleteSearchHistory({required String word}) async {
    try {
      return await ApiX.delete(DBContactX.deleteSearchHistory+word,token: LocalDataX.token);
    } catch (error) {
      CatchErrorX.console(error);
      return Future.error(error);
    }
  }
}
