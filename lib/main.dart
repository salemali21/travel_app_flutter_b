import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/helpers/binding.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/multi_language/langeuages/translations.dart';
import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/views/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // await CatchStorage.clear();  // Remove this line,
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        canvasColor: k_canvas,
        primarySwatch: k_primaryColor,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // locale: Locale("ar"),
      locale: Locale(CatchStorage.get(k_langKey) ?? "en"),
      fallbackLocale: Locale("en"),
      translations: Translation(),
      initialBinding: Binding(),
      home: SplashScreen(),
    );
  }
}
