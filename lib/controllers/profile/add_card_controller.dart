import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/models/card_model.dart';
import 'package:travel_app/network/firestore_service.dart';

class AddCardController extends GetxController {
  String cardNumber = "";
  String holderName = "";
  String CVC = "";
  bool isDefaultCard = false;
  DateRangePickerController dateRangePickerController = DateRangePickerController();

  bool isLaoding = false;

  String patternFormat = "EEE, d MMM";

  DateTime expirationDate = DateTime.now();
  late String expirationDateFormat;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  void onChangeCVCField(String value) {
    CVC = value;
    update();
  }

  void onChangeSwitch(bool value) {
    isDefaultCard = value;
    update();
  }

  Future<void> onSubmit() async {
    if (!formKey.currentState!.validate()) return;

    isLaoding = true;
    update();

    try {
      CardModel _model = CardModel(
        CardNumber: int.parse(cardNumber),
        CardHolerName: holderName,
        CVC: CVC,
        isDefaultCard: isDefaultCard,
        expirationDate: Timestamp.fromDate(expirationDate),
      );

      await FirestoreServic.instance.addNewCard(_model);

      Get.back();

      isLaoding = false;
      update();
    } on FirebaseException catch (error) {
      isLaoding = false;
      update();

      Get.snackbar(
        "Something is wrong".tr,
        error.message!,
        backgroundColor: Colors.red,
      );
    }
  }
}
