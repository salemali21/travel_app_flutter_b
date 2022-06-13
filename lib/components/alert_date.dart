import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'custom_button.dart';

class AlertDate extends StatelessWidget {
  const AlertDate({
    Key? key,
    this.DateRangeContoller,
    this.onPressed,
    required this.selectionMode,
  }) : super(key: key);
  final DateRangePickerController? DateRangeContoller;
  final void Function()? onPressed;
  final DateRangePickerSelectionMode selectionMode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.6,
        child: Column(
          children: [
            SfDateRangePicker(
              minDate: DateTime.now(),
              initialDisplayDate: DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionMode: selectionMode,
              controller: DateRangeContoller,
            ),
            CustomButton(
              text: "Ok".tr,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
