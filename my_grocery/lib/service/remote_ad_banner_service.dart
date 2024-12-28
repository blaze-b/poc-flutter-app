import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteAdBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banners';

  Future<dynamic> get() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=image'),
      headers: headers,
    );
    print('Log reponse: $remoteUrl');
    return response;
  }
}
