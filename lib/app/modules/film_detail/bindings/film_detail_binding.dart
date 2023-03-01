import 'package:get/get.dart';

import '../controllers/film_detail_controller.dart';

class FilmDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilmDetailController>(
      () => FilmDetailController(),
    );
  }
}
