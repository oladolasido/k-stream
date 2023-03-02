import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kstream/app/modules/film_detail/views/film_detail_view.dart';
import 'package:kstream/app/routes/app_pages.dart';
import 'package:kstream/constants/constants.dart';
import 'package:kstream/models/film_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('K-Stream v1.0.0',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) async {
          controller.films();
        },
        dispose: (_) {},
        builder: (_) {
          return Container(
              padding: const EdgeInsets.all(16),
              child: Obx(() => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.filmModel.value.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CardDrakor(
                            controller.filmModel.value.data![index]);
                      },
                    )));
        },
      ),
    );
  }
}

class CardDrakor extends StatelessWidget {
  CardDrakor(
    this.film, {
    super.key,
  });

  DataFilm film;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FilmDetailView(
          film: film,
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    mediaUrl + film.poster!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${film.title}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 4),
                      Text('Drama Korea',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                      const SizedBox(height: 4),
                      // Text('8 Video',
                      //     style: TextStyle(
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.normal,
                      //         color: Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // jam update
                          Text('1 Jam yang lalu',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                          // view
                          Text('${film.views ?? 0} views',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
