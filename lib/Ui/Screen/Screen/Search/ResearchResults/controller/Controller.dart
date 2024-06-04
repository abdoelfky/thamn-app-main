import 'package:get/get.dart';
import '../../../../../../Data/data.dart';
import '../../../../../../UI/Widget/widget.dart';

class ResearchResultsController extends GetxController {
  String search=Get.arguments;
  RxList<ProductX> products=<ProductX>[].obs;

  // RxInt selectedCategoryID=0.obs;
  // RxInt selectedSubcategoryID=0.obs;
  // List<CategoryX> categories=[];

  getData()async{
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
        products.value =await DatabaseX.getAll<ProductX>(api: DBContactX.getProductsWithSearch+search, fromJson: ProductX.fromJson);
      // }
    }catch(e){
      return Future.error(e);
    }
  }

  // List<SubcategoryX> get getSubcategories{
  //   if(selectedCategoryID.value!=0) {
  //     return categories.firstWhere((x) => x.id== selectedCategoryID.value,).subcategories;
  //   }else{
  //     return [];
  //   }
  // }


  // changeSelectedCategory(int id)async{
  //   if(id==selectedCategoryID.value){
  //     selectedCategoryID.value=0;
  //   }else{
  //     selectedCategoryID.value=id;
  //   }
  //   await getAllProducts();
  //   selectedSubcategoryID.value=0;
  // }
  // changeSelectedSubCategory(id)async{
  //   if(id!=selectedSubcategoryID.value){
  //     selectedSubcategoryID.value=id;
  //     await getAllProducts();
  //   }
  // }

}