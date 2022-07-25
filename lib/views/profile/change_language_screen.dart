import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:travel_app/controllers/profile/change_language_controller.dart';
import 'package:travel_app/helpers/constants.dart';

class ChangeLanguageScreen extends GetWidget<ChangeLanguageController> {
  const ChangeLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Change Language".tr,
          fontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
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
            GetBuilder<ChangeLanguageController>(builder: (controller) {
              return Container(
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
                      color:
                          controller.languageIndexSelected == index ? k_primaryColor : Colors.grey,
                      onPressed: () async {
                        controller.onChange(index);
                        // await controller.updateLocal(controller.languages[index].IsoCode);
                        // await Get.off(() => OnBoardingScreen());
                      },
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 15),
        width: Get.width,
        height: 63,
        child: CustomButton(
          text: "Save".tr,
          onPressed: () async {
            await controller.updateLocal();
          },
          radius: 0,
        ),
      ),
    );
  }
}
