import 'package:get/get.dart';
import 'package:my_grocery/model/ad_banner.dart';
import 'package:my_grocery/service/remote_ad_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();

  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;

  @override
  void onInit() {
    // Init all the methods
    getAdBanners();
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
      print('Banner id: ${bannerList.first.id}');
      print('Banner image: ${bannerList.first.image}');
      isBannerLoading(false);
    }
  }
}
