import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/product.dart';

class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-products';

  Future<dynamic> get() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=product.images'),
      headers: headers,
    );
    print('Log reponse: $remoteUrl');
    return response;
  }
}

// Class created to do the local storage for the objects
class LocalPopularProductService {
  late Box<Product> _popularProductBox;

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>('popularProducts');
  }

  Future<void> assignAllPopularProducts(
      {required List<Product> popularProducts}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(popularProducts);
  }

  List<Product> getPopularProducts() => _popularProductBox.values.toList();
}
