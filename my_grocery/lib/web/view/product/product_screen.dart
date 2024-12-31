import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/web/controller/dashboard_controller.dart';
import 'package:my_grocery/web/view/components/main_header.dart';
import 'package:my_grocery/web/view/product/components/product_grid.dart';
import 'package:my_grocery/web/view/product/components/product_loading_grid.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: Obx(() {
            bool isProductLoaded = productController.productList.isNotEmpty;
            print('Is product loaded : $isProductLoaded');
            if (isProductLoaded) {
              print('Inside product card loading..');
              return ProductGrid(products: productController.productList);
            } else {
              print('Inside default product loading...');
              return const ProductLoadingGrid();
            }
          }),
        )
      ],
    ));
  }
}
