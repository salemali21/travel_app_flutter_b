import 'package:get/get.dart';

class TourDetailsController extends GetxController {
  int currentCarouselIndex = 0;

  int currentViewDetailIndex = 0;

  List<String> viewDetail = [
    "Overview".tr,
    "Details".tr,
    "Reviews".tr,
    "Costs".tr,
  ];

  late String viewValue;

  @override
  void onInit() {
    super.onInit();
    viewValue = viewDetail[currentViewDetailIndex];
  }

  void onPageChanged(int newIndex) {
    currentCarouselIndex = newIndex;
    update();
  }

  void onChangeViewDetail(int newIndex) {
    currentViewDetailIndex = newIndex;
    viewValue = viewDetail[newIndex];
    update();
  }
}
