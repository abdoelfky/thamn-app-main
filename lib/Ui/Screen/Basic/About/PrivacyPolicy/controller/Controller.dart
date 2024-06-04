import 'package:get/get.dart';

import '../../../../../../Data/data.dart';

class PrivacyPolicyController extends GetxController {
  late String privacyPolicy;
  getData()async{
    try{
      privacyPolicy=await DatabaseX.getPrivacy();
    }catch(e){
      return Future.error(e);
    }
  }
}