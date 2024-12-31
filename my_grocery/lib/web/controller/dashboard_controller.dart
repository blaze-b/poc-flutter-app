import 'package:get/get.dart';
import 'package:my_grocery/web/controller/home_controller.dart';
import 'package:my_grocery/web/controller/product_controller.dart';

HomeController homeController = HomeController.instance;
ProductController productController = ProductController.instance;

class DashboardController extends GetxController {
  var tabIndex = 0;

  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
