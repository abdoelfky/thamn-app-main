part of data;

class ApiX {
  static Future post(String url,
      {Object? body, String token = '', bool isJson = true}) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'locale': TranslationX.getLanguage,
          'Accept': "application/json",
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200 && ((json.decode(response.body) as Map<String, dynamic>)['status']??true)==true) {
        return isJson
            ? json.decode(response.body) as Map<String, dynamic>
            : response.body;
      } else {
        return Future.error(json.decode(response.body)?['message']??json.decode(response.body)?['error']??'error');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future postImage(String url,{Map<String, String>? body,required File image,required String filename,required String token})async{
    try {
      ///MultiPart request
      var request = http.MultipartRequest(
        'POST', Uri.parse(url),

      );
      Map<String,String> headers={
        'Content-Type': 'application/json',
        'locale': TranslationX.getLanguage,
        'Accept': "application/json",
        'Authorization': 'Bearer $token',
      };
      request.files.add(
        http.MultipartFile(
          filename,
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: filename,
        ),
      );
      request.headers.addAll(headers);
      if(body!=null) {
        request.fields.addAll(body);
      }
      print(request.fields);
      var response  = await request.send();
      Map<String, dynamic> responseBody =json.decode(await response.stream.bytesToString());
      if (response.statusCode == 200 && responseBody['status']??true==true) {
        return responseBody;
      } else {
        return Future.error(responseBody['message']??'error');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
}
  static Future get(String url, {bool isJson = true,required String token}) async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-type': "application/json",
        'locale': TranslationX.getLanguage,
        'Accept': "application/json",
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200 && ((json.decode(response.body) as Map<String, dynamic>)['status']??true)==true) {
        return isJson
            ? json.decode(response.body) as Map<String, dynamic>
            : response.body;
      } else {
        return Future.error(json.decode(response.body)?['message']??json.decode(response.body)?['error']??'error');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }
  static Future delete(String url,
      {Object? body, String token = '', bool isJson = true}) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'locale': TranslationX.getLanguage,
          'Accept': "application/json",
          'Authorization': 'Bearer $token',
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200 && ((json.decode(response.body) as Map<String, dynamic>)['status']??true)==true) {
        return isJson
            ? json.decode(response.body) as Map<String, dynamic>
            : response.body;
      } else {
        return Future.error(json.decode(response.body)?['message']??json.decode(response.body)?['error']??'error');
      }
    } catch (e) {
      print(e);
      return Future.error(e.toString());
    }
  }

}
