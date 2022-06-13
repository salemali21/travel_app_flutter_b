import 'package:get/get.dart';
import 'package:travel_app/multi_language/langeuages/ar.dart';
import 'package:travel_app/multi_language/langeuages/en.dart';


class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
