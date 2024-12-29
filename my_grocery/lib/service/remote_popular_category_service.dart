import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';

  Future<dynamic> getPaginated() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate=category.images&pagination[start]=0&pagination[limit]=5'),
      headers: headers,
    );
    print('Log reponse: $remoteUrl');
    return response;
  }
}
