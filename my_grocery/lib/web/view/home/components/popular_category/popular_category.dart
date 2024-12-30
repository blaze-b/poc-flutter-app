import 'package:flutter/material.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/web/view/home/components/popular_category/popular_category_card.dart';

class PopularCategory extends StatelessWidget {
  final List<Category> categories;
  const PopularCategory({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            PopularCategoryCard(category: categories[index]),
      ),
    );
  }
}
