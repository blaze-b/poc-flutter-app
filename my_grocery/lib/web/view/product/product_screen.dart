import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/web/controller/controllers.dart';
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
            if (productController.isProductLoading.value) {
              return const ProductLoadingGrid();
            } else {
              if (isProductLoaded) {
                print('Inside product card loading..');
                return ProductGrid(products: productController.productList);
              } else {
                print('Inside default product not found...');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Story set image was used link: https://storyset.com/illustration/online-groceries/cuate
                    // Them color is used to create the story set: ff8900
                    Image.asset('assets/product_not_found.png'),
                    const SizedBox(height: 10),
                    const Text('Products Not Found!')
                  ],
                );
              }
            }
          }),
        ),
      ],
    ));
  }
}
