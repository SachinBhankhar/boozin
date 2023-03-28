import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      title: "Application",
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        fontFamily: GoogleFonts.nunito().fontFamily,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
    ),
  );
}
