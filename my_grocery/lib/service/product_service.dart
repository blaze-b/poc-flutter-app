import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse('$remoteUrl?populate[0]=tags&populate[1]=images'),
      headers: headers,
    );
    print('Log reponse: $remoteUrl');
    return response;
  }
}
