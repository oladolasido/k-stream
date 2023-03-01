import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:kstream/models/film_model.dart';

import '../controllers/film_detail_controller.dart';

class FilmDetailView extends GetView<FilmDetailController> {
  FilmDetailView({Key? key, required this.film}) : super(key: key);

  DataFilm film;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FilmDetailView'),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text('Film Video goes here',
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              film.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // genre
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              film.genre!,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              film.synopsis!,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
