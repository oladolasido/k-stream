import 'package:get/get.dart';
import 'package:kstream/app/modules/home/controllers/home_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
