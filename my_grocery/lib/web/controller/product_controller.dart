import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/service/product_service.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();

  TextEditingController searchTextEditingController = TextEditingController();

  // Default memory storage
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;
  RxString searchVal = ''.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);

      var result = await RemoteProductService().get();

      if (result != null) {
        // assign api result
        productList.addAll(productListFromJson(result.body));
      }
    } finally {
      print('Product list length: ${productList.length}');
      isProductLoading(false);
    }
  }

  void getProductsByName({required String keyword}) async {
    try {
      isProductLoading(true);

      var result = await RemoteProductService().getByName(keyword: keyword);

      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print('Product list length: ${productList.length}');
    }
  }
}
