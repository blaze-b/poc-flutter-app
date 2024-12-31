import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/product.dart';
import 'package:shimmer/shimmer.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String productImageUrl = baseUrl + product.images.first;
    String productName = product.name;
    var tags = product.tags;
    print('Product image URL: $productImageUrl');
    print('Product name: $productName');
    print('Product tags: $tags');
    return Material(
      elevation: 8,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: Hero(
                  tag: product.images.first,
                  child: CachedNetworkImage(
                    imageUrl: productImageUrl,
                    placeholder: (context, url) => Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey.shade300,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 5),
                  tags.isNotEmpty
                      ? Text(
                          '$currency${tags.first.price.toStringAsFixed(2)}',
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
