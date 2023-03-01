import 'package:get/get.dart';
import 'package:kstream/app/repositories/home_repository.dart';
import 'package:kstream/models/film_model.dart';
import 'package:kstream/utils/custom_log.dart';

class HomeController extends GetxController {
  Rx<FilmModel> filmModel = FilmModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void films() async {
    try {
      isLoading.value = true;
      filmModel.value = await HomeRepository().getFilms();
      isLoading.value = false;
    } catch (error) {
      logInfo(error.toString());
    }
  }
}
