import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/category.dart';

class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';

  Future<dynamic> getPaginated() async {
    var headers = {
      'Authorization': 'Bearer $apiKey',
    };
    var response = await client.get(
      Uri.parse(
          '$remoteUrl?populate=category.image&pagination[start]=0&pagination[limit]=5'),
      headers: headers,
    );
    print('Log reponse: $response');
    return response;
  }
}

// Class created to do the local storage for the objects
class LocalPopularCategoryService {
  late Box<Category> _popularCategoryBox;

  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('popularCategories');
  }

  Future<void> assignAllPopularCategories(
      {required List<Category> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  List<Category> getPopularCategories() => _popularCategoryBox.values.toList();
}
