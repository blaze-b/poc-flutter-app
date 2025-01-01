import 'package:get/get.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/service/catgegory_service.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();

  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;

  RxBool isCategoryLoading = false.obs;

  @override
  void onInit() async {
    // Init all the methods
    getCategories();
    super.onInit();
  }

  void getCategories() async {
    try {
      isCategoryLoading(true);

      // Call api
      var result = await RemoteCategoryService().get();

      if (result != null) {
        // assign api result
        categoryList.assignAll(categoryListFromJson(result.body));
      }
    } finally {
      print('Category list length: ${categoryList.length}');
      isCategoryLoading(false);
    }
  }
}
