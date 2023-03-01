import 'package:get/get.dart';

import '../bindings/BaseBindings.dart';
import '../modules/film_detail/bindings/film_detail_binding.dart';
import '../modules/film_detail/views/film_detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class App {
  App._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: BaseBindings(),
    ),
  ];
}
