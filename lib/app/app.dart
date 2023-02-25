import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kstream/app/modules/home/views/home_view.dart';
import 'package:kstream/app/modules/splash/splash_page.dart';
import 'package:kstream/app/routes/app_pages.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'K-Stream',
      debugShowCheckedModeBanner: false,
      // add font
      theme: ThemeData(
        fontFamily: GoogleFonts.openSans().fontFamily,
      ),
      initialRoute: Routes.SPLASHSCREEN,
      getPages: [
        GetPage(
          name: Routes.SPLASHSCREEN,
          page: () => SplashScreen(),
        ),
        GetPage(
          name: Routes.HOME,
          page: () => HomeView(),
        ),
      ],
    );
  }
}
