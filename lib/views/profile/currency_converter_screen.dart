import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/controllers/profile/currency_converter_controller.dart';
import 'package:travel_app/helpers/constants.dart';

class CurrencyConverterScreen extends GetWidget<CurrencyConverterController> {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Converter".tr,
          fontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<CurrencyConverterController>(
        builder: (controller) {
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _BuildItem(
                              imagePath: "assets/images/USD.png",
                              text: "USD".tr,
                            ),
                            BuildImage(
                              image: "assets/images/compair_arrows.png",
                              isNetworkImage: false,
                            ),
                            _BuildItem(
                              imagePath: "assets/images/EUR.png",
                              text: "EUR".tr,
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: k_primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "${controller.currencyLiveModel.quotes!.uSDUSD}" +
                                        " " +
                                        "USD".tr +
                                        " = " +
                                        "${controller.currencyLiveModel.quotes!.uSDEUR!.toStringAsFixed(3)}" +
                                        " " +
                                        "EUR".tr,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 80),
                        Container(
                          width: Get.width,
                          height: 63,
                          child: CustomButton(
                            text: "Continue".tr,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}

class _BuildItem extends StatelessWidget {
  const _BuildItem({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);
  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 135,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
            offset: Offset(3, 6),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: BuildImage(
                image: imagePath,
                isNetworkImage: false,
                width: 55,
                height: 55,
              ),
            ),
            SizedBox(height: 10),
            CustomText(
              text: text,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
