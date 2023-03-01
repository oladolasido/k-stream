import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kstream/app/modules/home/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // Navigasi ke layar utama aplikasi setelah 3 detik
      Get.off(() => HomeView(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo/k-stream.png', // Ganti dengan nama file gambar splash screen
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
