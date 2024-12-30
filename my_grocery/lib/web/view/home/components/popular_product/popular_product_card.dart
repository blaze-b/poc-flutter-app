import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:my_grocery/model/product.dart';
import 'package:shimmer/shimmer.dart';

class PopularProductCard extends StatelessWidget {
  final Product product;
  const PopularProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    String productImageUrl = baseUrl + product.images.first;
    String productName = product.name;
    print('Product image URL: $productImageUrl');
    print('Product name: $productName');
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: Material(
        elevation: 8,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.all(10),
          width: 120,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.9,
                child: CachedNetworkImage(
                  imageUrl: productImageUrl,
                  placeholder: (context, url) => Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey.shade300,
                    child: Container(
                      color: Colors.grey,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  productName,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
