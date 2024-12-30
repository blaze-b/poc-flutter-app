import 'package:flutter/widgets.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/web/view/home/components/popular_product/popular_product_card.dart';

class PopularProduct extends StatelessWidget {
  final List<Product> popularProducts;
  const PopularProduct({super.key, required this.popularProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) =>
            PopularProductCard(product: popularProducts[index]),
      ),
    );
  }
}
