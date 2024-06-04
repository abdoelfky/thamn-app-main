import 'package:get/get.dart';

import '../../../../../../Data/data.dart';

class TermsOfServiceController extends GetxController {
  late String termsOfService;
  getData()async{
    try{
      termsOfService=await DatabaseX.getTerms();
    }catch(e){
      return Future.error(e);
    }
  }
}