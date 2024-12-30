import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemotePopularProduct {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-products';

  Future<dynamic> get() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate[0]=product.tags&populate[1]=product.images'),
      headers: headers,
    );
    print('Log reponse: $remoteUrl');
    return response;
  }
}
