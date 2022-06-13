import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/helpers/enum_helper.dart';

class SearchOptionController extends GetxController {
  final city = TextEditingController();
  final checkIn = TextEditingController();
  DateTime? checkInDateTime;
  final checkOut = TextEditingController();
  DateTime? checkOutDateTime;
  final dateFormat = "EEE, d MMM";

  DateRangePickerController? dateController = DateRangePickerController();
  late String economyValue;
  List<String> economyItems = [
    "Premium_Economy".tr,
    "Business".tr,
    "First".tr,
  ];
  int room = 1;
  int adult = 1;
  int infants = 0;
  int children = 0;
  final _now = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    economyValue = economyItems[0];
    checkIn.text = DateFormat(dateFormat).format(DateTime.now());
    checkOut.text = DateFormat(dateFormat).format(DateTime(_now.year, _now.month, _now.day + 1));

    checkInDateTime = DateTime.now();
    checkOutDateTime = DateTime(_now.year, _now.month, _now.day + 1);
  }

  void onSelectDate() {
    if (dateController?.selectedRange!.startDate == null) return;
    if (dateController?.selectedRange!.endDate == null) return;

    checkInDateTime = dateController?.selectedRange!.startDate;
    checkOutDateTime = dateController?.selectedRange!.endDate;

    checkIn.text =
        DateFormat(dateFormat).format(dateController?.selectedRange!.startDate as DateTime);
    checkOut.text =
        DateFormat(dateFormat).format(dateController?.selectedRange!.endDate as DateTime);
    update();
    Get.back();
  }

  void desplay() {
    print(dateController?.selectedRange!.startDate);
    print(dateController?.selectedRange!.endDate);
  }

  void increase(CounterType type) {
    switch (type) {
      case CounterType.adult:
        if (adult < 10) adult++;
        break;
      case CounterType.room:
        if (room < 10) room++;
        break;
      case CounterType.infants:
        if (infants < 10) infants++;
        break;
      case CounterType.children:
        if (children < 10) children++;
        break;
    }
    update();
  }

  void decrease(CounterType type) {
    switch (type) {
      case CounterType.adult:
        if (adult > 1) adult--;
        break;
      case CounterType.room:
        if (room > 1) room--;
        break;
      case CounterType.infants:
        if (infants > 0) infants--;
        break;
      case CounterType.children:
        if (children > 0) children--;
        break;
    }
    update();
  }

  void onChanged(String? value) {
    economyValue = value!;
    update();
  }
}
