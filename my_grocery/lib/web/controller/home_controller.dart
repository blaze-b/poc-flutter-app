import 'package:get/get.dart';
import 'package:my_grocery/model/ad_banner.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/service/remote_ad_banner_service.dart';
import 'package:my_grocery/service/remote_popular_category_service.dart';
import 'package:my_grocery/service/remote_popular_product.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;

  @override
  void onInit() {
    // Init all the methods
    getAdBanners();
    getPopularCategories();
    getPopularProduct();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      var result = await RemoteAdBannerService().get();
      if (result != null) {
        bannerList.addAll(adBannerListFromJson(result.body));
      }
    } finally {
      print('Banner list length: ${bannerList.length}');
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);
      var result = await RemotePopularCategoryService().getPaginated();
      if (result != null) {
        popularCategoryList.addAll(popularCategoryListFromJson(result.body));
      }
    } finally {
      print('Popular category list length: ${popularCategoryList.length}');
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      var result = await RemotePopularProduct().get();
      if (result != null) {
        popularProductList.addAll(popularProductListFromJson(result.body));
      }
    } finally {
      print('Popular product list length: ${popularCategoryList.length}');
      isPopularProductLoading(false);
    }
  }
}
