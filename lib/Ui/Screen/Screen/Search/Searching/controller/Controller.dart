import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../Config/config.dart';
import '../../../../../../Data/data.dart';

class SearchingController extends GetxController {

  RxList<String> searchHistories=<String>[].obs;
  RxList<AutoCompleteX> autoCompletes=<AutoCompleteX>[].obs;
  List<String> popularSearches=[];
  TextEditingController searchText=TextEditingController();
  RxList<ProductX> products=<ProductX>[].obs;


  getData()async{
    try {
      popularSearches = await DatabaseX.getPopularSearches();
      searchHistories.value= await DatabaseX.getSearchHistory();
    } catch (e) {
      return Future.error(e);
    }
  }
  // searchResults({String? word}){
  //   // Get.toNamed(RouteNameX.researchResults,arguments: word??searchText.text);
  //   getAllProducts();
  // }
  getAutoCompletes(search)async{
    try {
      autoCompletes.value =await DatabaseX.getAll<AutoCompleteX>(api: DBContactX.getSearchAutoComplete+search, fromJson: AutoCompleteX.fromJson);
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<List<AutoCompleteX>> searchingAutoComplete(String search)async{
    if(search.isNotEmpty) {
      await getAutoCompletes(search);
      return autoCompletes;
    }else{
      return [];
    }
  }

  removeSearchHistory(word) async {
    try {
      searchHistories.removeWhere((x) => x==word);
      await DatabaseX.deleteSearchHistory(word:word);
    } catch (e) {
      return Future.error(e);
    }
  }
  onTapSearchAutoComplete(id){
    Get.toNamed(RouteNameX.productDetails,arguments: id);
  }


  getAllData()async{
    try{
      // categories= await DatabaseX.getCategories();
      await getAllProducts();
    }catch(e){
      return Future.error(e);
    }
  }
  getAllProducts()async{
    try{
      // if(selectedCategoryID.value!=0 && selectedSubcategoryID.value==0) {
      //   products.value =await DatabaseX.getAll<ProductX>(api: DBContactX.getProductsByCategoryWithSearch(categoryID: selectedCategoryID.value, query: search),fromJson: ProductX.fromJson);
      // }else if(selectedSubcategoryID.value!=0) {
      //   products.value =await DatabaseX.getAll<ProductX>(api: DBContactX.getProductsByCategoryWithSearch(categoryID: selectedSubcategoryID.value, query: search), fromJson: ProductX.fromJson);
      // }else{
      products.value =await DatabaseX.getAll<ProductX>(api: DBContactX.getProductsWithSearch+searchText.text, fromJson: ProductX.fromJson);
      // }
    }catch(e){
      return Future.error(e);
    }
  }








}