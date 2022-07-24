import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/helpers/binding.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/multi_language/langeuages/translations.dart';
import 'package:travel_app/helpers/catch_storage.dart';
import 'package:travel_app/views/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  MainUser.instance.onInit();
  // await CatchStorage.clear();  // Remove this line,
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String _getLanguage() {
    String lang = CatchStorage.get(k_langKey) ?? "en";
    return lang;
  }

  String? _getFont() {
    if (_getLanguage() == "en") {
      return GoogleFonts.poppins().fontFamily;
    }
    if (_getLanguage() == "ar") {
      return GoogleFonts.tajawal().fontFamily;
    }
    return GoogleFonts.poppins().fontFamily;
  }

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
        fontFamily: _getFont(),
      ),
      // locale: Locale("ar"),
      locale: Locale(_getLanguage()),
      fallbackLocale: Locale("en"),
      translations: Translation(),
      initialBinding: Binding(),
      home: SplashScreen(),
    );
  }
}
