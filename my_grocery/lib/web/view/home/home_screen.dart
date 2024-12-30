import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/web/view/components/section_title.dart';
import 'package:my_grocery/web/view/home/components/banner/carousel_loading.dart';
import 'package:my_grocery/web/view/home/components/banner/carousel_slider_view.dart';
import 'package:my_grocery/web/view/components/main_header.dart';
import 'package:my_grocery/web/controller/dashboard_controller.dart';
import 'package:my_grocery/web/view/home/components/popular_category/popular_category.dart';
import 'package:my_grocery/web/view/home/components/popular_category/popular_category_loading.dart';
import 'package:my_grocery/web/view/home/components/popular_product/popular_product.dart';
import 'package:my_grocery/web/view/home/components/popular_product/popular_product_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Obx(() {
                    bool isBannerLoaded = homeController.bannerList.isNotEmpty;
                    print('Is banner loaded : $isBannerLoaded');
                    if (isBannerLoaded) {
                      print('Inside carousel slider...');
                      return CarouselSliderView(
                          bannerList: homeController.bannerList);
                    } else {
                      print('Inside carousel loading...');
                      return CarouselLoading();
                    }
                  }),
                  const SectionTitle(title: "Popular Category"),
                  Obx(() {
                    bool isPopularCategoryLoaded =
                        homeController.popularCategoryList.isNotEmpty;
                    print(
                        'Is popular categories loaded : $isPopularCategoryLoaded');
                    if (isPopularCategoryLoaded) {
                      print('Inside popular category loader...');
                      return PopularCategory(
                        categories: homeController.popularCategoryList,
                      );
                    } else {
                      print('Inside default popular category loader...');
                      return PopularCategoryLoading();
                    }
                  }),
                  const SectionTitle(title: "Popular Product"),
                  Obx(() {
                    bool isPopularProductLoaded =
                        homeController.popularProductList.isNotEmpty;
                    print(
                        'Is popular product loaded : $isPopularProductLoaded');
                    if (isPopularProductLoaded) {
                      print('Inside popular product loader...');
                      return PopularProduct(
                          popularProducts: homeController.popularProductList);
                    } else {
                      print('Inside default popular product loader...');
                      return PopularProductLoading();
                    }
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
