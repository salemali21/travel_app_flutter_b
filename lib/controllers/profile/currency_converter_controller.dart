import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:travel_app/models/currency_model.dart';

class CurrencyConverterController extends GetxController {
  bool isLoading = false;
  bool hasError = false;
  CurrencyModel? currencyModel;
  CurrencyModel? convertCurrency;

  double result = 0;

  final TextEditingController amount = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onInit() async {
    super.onInit();

    await getCurrency();
  }

  Future<void> getCurrency() async {
    isLoading = true;
    hasError = false;
    update();
    try {
      String url = "https://v6.exchangerate-api.com/v6/e9b844120dec00f6903453b5/latest/USD";
      var response = await Dio(BaseOptions(connectTimeout: 10 * 1000)).get(url);
      if (response.statusCode != 200) throw "Error with response";

      currencyModel = CurrencyModel.fromJson(response.data);
      isLoading = false;
      update();
    } catch (error) {
      isLoading = false;
      hasError = true;
      update();
      print("in getCurrency function");
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
