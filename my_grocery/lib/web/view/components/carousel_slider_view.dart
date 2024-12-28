import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/model/ad_banner.dart';
import 'package:my_grocery/web/view/components/banner_card.dart';

class CarouselSliderView extends StatefulWidget {
  final List<AdBanner> bannerList;
  const CarouselSliderView({super.key, required this.bannerList});

  @override
  State<CarouselSliderView> createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  // int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    // initialise here
    _bannerList =
        widget.bannerList.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: _bannerList,
          options: CarouselOptions(
            autoPlay: true,
          ),
        )
      ],
    );
  }
}
