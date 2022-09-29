import 'package:http/http.dart' as http;

class Api {
  Future<http.Response> getData({required String strUrl}) async {
    http.Response res = await http.get(Uri.parse(strUrl));
    return res;
  }
}
