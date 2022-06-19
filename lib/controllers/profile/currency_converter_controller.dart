import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/helpers/dio_helper.dart';
import 'package:travel_app/helpers/end_point.dart';
import 'package:travel_app/models/currency_live_model.dart';
import 'package:travel_app/models/currency_model.dart';

class CurrencyConverterController extends GetxController {
  bool isLoading = false;
  CurrencyModel currencyModel = CurrencyModel();
  CurrencyLiveModel currencyLiveModel = CurrencyLiveModel();

  double result = 0;

  final TextEditingController amount = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onInit() async {
    super.onInit();
    isLoading = true;
    update();

    await getCurrencyLive();

    isLoading = false;
    update();
  }

  Future<void> getCurrencyLive() async {
    try {
      var response = await DioHelper.getData(url: LIVE);
      if (response.statusCode != 200) throw "Error with response";
      if (response.data["success"] == false) throw "Error with response in success state";
      currencyLiveModel = CurrencyLiveModel.fromJson(response.data);
    } catch (error) {
      print("in getCurrencyLive function");
      print(error.toString());
    }
  }

  Future<void> convertAmount() async {
    if (!formKey.currentState!.validate()) return;
    try {
      var response = await DioHelper.getData(
        url: CONVERT,
        query: {"amount": int.parse(amount.text), "from": "USD", "to": "EUR"},
      );

      if (response.statusCode != 200) throw "Error with response";
      if (response.data["success"] == false) throw "Error with response in success state";
      currencyModel = CurrencyModel.fromJson(response.data);
      result = currencyModel.result!;
      update();
    } catch (error) {
      print("in convertAmount function");

      print(error.toString());
    }
  }
}
