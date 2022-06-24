import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/helpers/dio_helper.dart';
import 'package:travel_app/helpers/network_url.dart';
import 'package:travel_app/models/currency_live_model.dart';
import 'package:travel_app/models/currency_model.dart';

class CurrencyConverterController extends GetxController {
  bool isLoading = false;
  CurrencyModel? currencyModel;
  CurrencyModel? convertCurrency;

  double result = 0;

  final TextEditingController amount = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onInit() async {
    super.onInit();
    isLoading = true;
    update();

    await getCurrency();

    isLoading = false;
    update();
  }

  Future<void> getCurrency() async {
    try {
      // var response = await DioHelper.getData(url: LIVE);
      String url = "https://v6.exchangerate-api.com/v6/e9b844120dec00f6903453b5/latest/USD";
      var response = await Dio().get(url);
      if (response.statusCode != 200) throw "Error with response";

      currencyModel = CurrencyModel.fromJson(response.data);
      // currencyLiveModel = CurrencyLiveModel.fromJson(response.data);
    } catch (error) {
      print("in getCurrencyLive function");
      print(error.toString());
    }
  }

  Future<void> convertAmount() async {
    if (!formKey.currentState!.validate()) return;
    try {
      String url = "https://v6.exchangerate-api.com/v6/e9b844120dec00f6903453b5/latest/USD";
      var response = await Dio().get(url);

      if (response.statusCode != 200) throw "Error with response";

      convertCurrency = CurrencyModel.fromJson(response.data);
      result = currencyModel!.conversionRates!.eUR * double.parse(amount.text);
      update();
    } catch (error) {
      print("in convertAmount function");

      print(error.toString());
    }
  }
}
