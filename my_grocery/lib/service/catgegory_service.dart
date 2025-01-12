import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/category.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=image'),
    );
    print('Log reponse: $response');
    return response;
  }
}

// Class created to do the local storage for the objects
class LocalCategoryService {
  late Box<Category> _categoryBox;

  Future<void> init() async {
    _categoryBox = await Hive.openBox<Category>('categories');
  }

  Future<void> assignAllCategories({required List<Category> categories}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(categories);
  }

  List<Category> getCategories() => _categoryBox.values.toList();
}
