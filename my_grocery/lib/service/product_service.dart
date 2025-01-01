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

    print('Remote url: $remoteUrl');
    print('Log reponse: $response');
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };

    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate[0]=tags&populate[1]=images&filters[name][\$contains]=$keyword'),
      headers: headers,
    );

    print('Remote url: $remoteUrl');
    print('Log reponse for product search by keyword: $response');

    return response;
  }
}
