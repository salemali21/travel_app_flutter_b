import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/components/alert_date.dart';
import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_field.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:get/get.dart';
import 'package:travel_app/controllers/profile/add_card_controller.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/enum_helper.dart';
import 'package:travel_app/helpers/validator_helper.dart';

class AddCardScreen extends GetWidget<AddCardController> {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Add New Card".tr,
          fontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<AddCardController>(
        builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            width: Get.width,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: Get.width * 0.75,
                              height: 60,
                              decoration: BoxDecoration(
                                color: k_primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            width: Get.width,
                            height: 180,
                            decoration: BoxDecoration(
                              color: k_primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    BuildImage(
                                      image: "assets/images/wallet.png",
                                      isNetworkImage: false,
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.contain,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.more_horiz,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                CustomText(
                                  text: controller.cardNumber,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  maxLines: 1,
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: "Card Holder".tr,
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                          CustomText(
                                            text: controller.holderName,
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                    BuildImage(
                                      image: "assets/images/master_card.png",
                                      isNetworkImage: false,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomText(
                      text: "Enter Informaton".tr,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 15),
                    CustomText(
                      text: "Card Number".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    CustomField(
                      hint: "Card Number".tr,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return ValidatorHelper.instance
                            .validator(value: value, type: FieldType.cardNumber);
                      },
                      onChanged: controller.onChangeCardNumberField,
                      suffixIcon: BuildImage(
                        image: "assets/images/master_card_small.png",
                        isNetworkImage: false,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomText(
                      text: "Card Holder".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    CustomField(
                      hint: "Enter card holder name".tr,
                      validator: (value) {
                        return ValidatorHelper.instance
                            .validator(value: value, type: FieldType.cardHolder);
                      },
                      onChanged: controller.onChangeCardHolderField,
                      suffixIcon: BuildImage(
                        image: "assets/images/master_card_small.png",
                        isNetworkImage: false,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomText(
                      text: "Expiration Date".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDate(
                                selectionMode: DateRangePickerSelectionMode.single,
                                DateRangeContoller: controller.dateRangePickerController,
                                onPressed: () {
                                  controller.onSelectedDate();
                                },
                              );
                            },
                          );
                        },
                        child: CustomField(
                          hint: controller.expirationDateFormat,
                          enabled: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    CustomText(
                      text: "CVC".tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5),
                    CustomField(
                      validator: (value) {
                        return ValidatorHelper.instance
                            .validator(value: value, type: FieldType.CVC);
                      },
                      hint: "0".tr,
                      onChanged: controller.onChangeCVCField,
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Switch.adaptive(
                          activeColor: k_primaryColor,
                          value: controller.isDefaultCard,
                          onChanged: controller.onChangeSwitch,
                        ),
                        CustomText(text: "Mark as default card".tr),
                      ],
                    ),
                    SizedBox(height: 25),
                    CustomButton(
                      text: "Save".tr,
                      onPressed: controller.isLaoding
                          ? null
                          : () {
                              controller.onSubmit();
                            },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
