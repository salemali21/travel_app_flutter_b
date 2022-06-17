import 'package:get/get.dart';
import 'package:travel_app/helpers/dio_helper.dart';
import 'package:travel_app/helpers/end_point.dart';
import 'package:travel_app/models/currency_live_model.dart';
import 'package:travel_app/models/currency_model.dart';

class CurrencyConverterController extends GetxController {
  bool isLoading = false;
  CurrencyModel currencyModel = CurrencyModel();
  CurrencyLiveModel currencyLiveModel = CurrencyLiveModel();

  onInit() async {
    super.onInit();
    isLoading = true;
    update();

    await getCurrencyConverter();
    await getCurrencyLive();

    isLoading = false;
    update();
  }

  Future<void> getCurrencyLive() async {
    try {
      var response = await DioHelper.getData(url: LIVE);
      // if (response != 200) throw "Error with response";
      // if (response.data["success"] == false) throw "Error with response in success";
      currencyLiveModel = CurrencyLiveModel.fromJson(response.data);
    } catch (error) {
      print("in getCurrencyLive function");
      print(error.toString());
    }
  }

  Future<void> getCurrencyConverter() async {
    try {
      var response = await DioHelper.getData(
        url: CONVERT,
        query: {"amount": 1, "from": "EUR", "to": "USD"},
      );

      // if (response != 200) throw "Error with response";
      // if (response.data["success"] == false) throw "Error with response in success";
      currencyModel = CurrencyModel.fromJson(response.data);
    } catch (error) {
      print("in getCurrencyConverter function");

      print(error.toString());
    }
  }
}
