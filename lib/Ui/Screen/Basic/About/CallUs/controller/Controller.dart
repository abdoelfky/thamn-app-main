import 'package:get/get.dart';
import '../../../../../../Data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsController extends GetxController {
  late String callUsEmail;
  late String callUsPhone;
  getData()async{
    try{
      await DatabaseX.getCallUs().then((value){
        callUsEmail=value.$1;
        callUsPhone=value.$2;
      });
    }catch(e){
      return Future.error(e);
    }
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void sendEmail(String suggestion) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: callUsEmail.toString(),
      query: encodeQueryParameters(<String, String>{
        'subject': 'Suggestion Selected: $suggestion',
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }


  void makePhoneCall() async {
    final Uri phoneCallUri = Uri(
      scheme: 'tel',
      path: callUsPhone,
    );

    if (await canLaunchUrl(phoneCallUri)) {
      await launchUrl(phoneCallUri);
    } else {
      throw 'Could not launch $phoneCallUri';
    }
  }


}