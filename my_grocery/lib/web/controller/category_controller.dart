import 'package:get/get.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/service/catgegory_service.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();

  // Hive storage
  final LocalCategoryService _localCategoryService = LocalCategoryService();

  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    // Init the hive
    await _localCategoryService.init();

    // Init all the methods
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);

      // assigning the local popular products before call
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }

      // Call api
      var result = await RemoteCategoryService().get();

      if (result != null) {
        // assign api result
        categoryList.assignAll(categoryListFromJson(result.body));

        // save api result to local db
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
      }
    } finally {
      print('Category list length: ${categoryList.length}');
      isCategoryLoading(false);
    }
  }
}
