part of data;

class CookieX{

  static remove(String key) {
    html.document.cookie = "$key=; max-age=2592000; path=/;";
  }
  static void put({required String key, required String value}) {
    // 2592000 sec = 30 days.
    html.document.cookie = "$key=$value; max-age=2592000; path=/;";
  }
  static String get(String key,{required String defaultValue}) {
    String? cookies = html.document.cookie??'';
    if(cookies!=''){
      List<String> listValues = cookies.split(";");
      String? matchVal;
      for (int i = 0; i < listValues.length; i++) {
        List<String> map = listValues[i].split("=");
        String _key = map[0].trim();
        String _val = map[1].trim();
        if (key == _key) {
          matchVal = _val;
          break;
        }
      }
      return matchVal??defaultValue;
    }
    return defaultValue;
  }
}