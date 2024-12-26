import 'package:get/get.dart';
import 'package:my_grocery/web/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // implement dependencies
    Get.put(DashboardController());
  }
}
