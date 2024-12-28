import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/web/view/components/carousel_loading.dart';
import 'package:my_grocery/web/view/components/carousel_slider_view.dart';
import 'package:my_grocery/web/view/components/main_header.dart';
import 'package:my_grocery/web/controller/dashboard_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Obx(() {
            bool isBannerLoaded = homeController.bannerList.isNotEmpty;
            print('Is loaded : $isBannerLoaded');
            if (isBannerLoaded) {
              print('Inside carousel slider...');
              return CarouselSliderView(bannerList: homeController.bannerList);
            } else {
              print('Inside carousel loading...');
              return CarouselLoading();
            }
          }),
        ],
      ),
    );
  }
}
