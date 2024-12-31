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

  // Hive db storage
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();
  final LocalProductService _localProductService = LocalProductService();

  @override
  void onInit() async {
    // Init the hive
    await _localAdBannerService.init();
    await _localCategoryService.init();
    await _localProductService.init();

    // Init all the methods
    getAdBanners();
    getPopularCategories();
    getPopularProduct();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);

      // assigning the local ad banners before call
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }

      // Call api
      var result = await RemoteAdBannerService().get();
      if (result != null) {
        // assign api result
        bannerList.addAll(adBannerListFromJson(result.body));
        // save api result to local db
        _localAdBannerService.assignAllAdBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      print('Banner list length: ${bannerList.length}');
      isBannerLoading(false);
    }
  }

  void getPopularCategories() async {
    try {
      isPopularCategoryLoading(true);

      // assigning the local popular categories before call
      if (_localCategoryService.getPopularCategories().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategoryService.getPopularCategories());
      }

      var result = await RemotePopularCategoryService().getPaginated();
      if (result != null) {
        // assign api result
        popularCategoryList.addAll(popularCategoryListFromJson(result.body));

        // save api result to local db
        _localCategoryService.assignAllPopularCategories(
            popularCategories: popularCategoryListFromJson(result.body));
      }
    } finally {
      print('Popular category list length: ${popularCategoryList.length}');
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);

      // assigning the local popular products before call
      if (_localProductService.getPopularProducts().isNotEmpty) {
        popularProductList.assignAll(_localProductService.getPopularProducts());
      }

      var result = await RemotePopularProduct().get();
      if (result != null) {
        // assign api result
        popularProductList.addAll(popularProductListFromJson(result.body));

        // save api result to local db
        _localProductService.assignAllPopularProducts(
            popularProducts: popularProductListFromJson(result.body));
      }
    } finally {
      print('Popular product list length: ${popularCategoryList.length}');
      isPopularProductLoading(false);
    }
  }
}
