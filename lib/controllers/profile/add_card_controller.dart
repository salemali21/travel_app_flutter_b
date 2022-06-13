import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddCardController extends GetxController {
  String cardNumber = "";
  String holderName = "";
  String CVC = "";
  DateRangePickerController dateRangePickerController = DateRangePickerController();

  String patternFormat = "EEE, d MMM";

  DateTime expirationDate = DateTime.now();
  late String expirationDateFormat;

  @override
  void onInit() {
    super.onInit();
    expirationDateFormat = DateFormat(patternFormat).format(expirationDate);
  }

  void onChangeCardNumberField(String value) {
    cardNumber = value;
    update();
  }

  void onChangeCardHolderField(String value) {
    holderName = value;
    update();
  }

  void onSelectedDate() {
    if (dateRangePickerController.selectedDate == null) return;
    expirationDate = dateRangePickerController.selectedDate!;
    expirationDateFormat = DateFormat(patternFormat).format(expirationDate);
    update();
    Get.back();
  }
}
