import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/multi_language/controllers/multi_laguage_controller.dart';
import 'package:travel_app/views/on_boarding/on_boarding_screen.dart';

class ChooseLanguageScreen extends StatelessWidget {
  ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MultiLanguageController>(
        init: MultiLanguageController(),
        builder: (controller) {
          return Scaffold(
            body: Container(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Choose Your Language".tr,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 180,
                    width: Get.width * 0.85,
                    child: ListView.separated(
                      itemCount: controller.languages.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CustomButton(
                          text: controller.languages[index].language,
                          onPressed: () async {
                            await controller.updateLocal(controller.languages[index].IsoCode);
                            await Get.off(() => OnBoardingScreen());
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
