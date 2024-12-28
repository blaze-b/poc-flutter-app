import 'package:get/get.dart';
import 'package:my_grocery/web/controller/home_controller.dart';

HomeController homeController = HomeController.instance;

class DashboardController extends GetxController {
  var tabIndex = 0;

  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
