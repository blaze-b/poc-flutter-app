import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=image'),
      headers: headers,
    );
    print('Log reponse: $response');
    return response;
  }
}
