import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class FilmDetailController extends GetxController {
  //TODO: Implement FilmDetailController

  Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.network('').obs;

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

  void updateLink(String url) {
    videoPlayerController.value = VideoPlayerController.network(url);
  }
}
