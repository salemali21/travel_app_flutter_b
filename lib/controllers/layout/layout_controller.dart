import 'package:get/get.dart';

class LayoutController extends GetxController {
  int index = 0;

  void onTapChange(int newIndex) {
    index = newIndex;
    update();
  }
}
