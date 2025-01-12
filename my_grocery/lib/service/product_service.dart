import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl?populate[0]=tags&populate[1]=images'),
    );

    print('Remote url: $remoteUrl');
    print('Log reponse: $response');
    return response;
  }

  Future<dynamic> getByName({required String keyword}) async {
    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate[0]=tags&populate[1]=images&filters[name][\$contains]=$keyword'),
    );

    print('Remote url: $remoteUrl');
    print('Log reponse for product search by keyword: $response');

    return response;
  }

  Future<dynamic> getByCategory({required int id}) async {
    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate[0]=tags&populate[1]=images&populate[2]=category&filters[category][id]=$id'),
    );

    print('Remote url: $remoteUrl');
    print('Log reponse for product search by category id: $response');

    return response;
  }
}
