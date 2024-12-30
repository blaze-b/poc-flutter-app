import 'dart:convert';

import 'package:my_grocery/model/tag.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(
      json
          .decode(val)['data']
          .map((val) => Product.popularProductFromJson(val)),
    );

class Product {
  final int id;
  final String name;
  final String description;
  final List<String> images;
  final List<Tag> tags;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.tags,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['product']['name'],
        description: data['product']['description'],
        images: List<String>.from(
            data['product']['images'].map((image) => image['url'])),
        tags: [],
      );
}
