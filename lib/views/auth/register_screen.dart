import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_field.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:get/get.dart';
import 'package:travel_app/controllers/auth/register_controller.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/enum_helper.dart';
import 'package:travel_app/helpers/validator_helper.dart';
import 'package:travel_app/views/auth/login_screen.dart';

class RegisterScreen extends GetWidget<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CustomText(
                    text: "register".tr,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 30),
                  CustomField(
                    hint: "full_name".tr,
                    controller: controller.name,
                    validator: (value) {
                      return ValidatorHelper.instance.validator(
                        value: controller.name.text,
                        type: FieldType.name,
                      );
                    },
                  ),
                  SizedBox(height: 25),
                  CustomField(
                    hint: "enter_email".tr,
                    controller: controller.email,
                    validator: (value) {
                      return ValidatorHelper.instance.validator(
                        value: controller.email.text,
                        type: FieldType.email,
                      );
                    },
                  ),
                  SizedBox(height: 25),
                  CustomField(
                    hint: "password".tr,
                    suffixIcon: LineIcon.lowVision(),
                    obscureText: true,
                    controller: controller.password,
                    validator: (value) {
                      return ValidatorHelper.instance.validator(
                        value: controller.password.text,
                        type: FieldType.password,
                      );
                    },
                  ),
                  SizedBox(height: 25),
                  CustomField(
                    hint: "confirm_password".tr,
                    suffixIcon: LineIcon.lowVision(),
                    controller: controller.confirmPassword,
                    obscureText: true,
                    validator: (value) {
                      return ValidatorHelper.instance.validator(
                        value: controller.confirmPassword.text,
                        matchText: controller.password.text,
                        type: FieldType.confirmPassword,
                      );
                    },
                  ),
                  SizedBox(height: 50),
                  GetBuilder<RegisterController>(builder: (controller) {
                    return CustomButton(
                      width: Get.width,
                      text: "register".tr,
                      onPressed: controller.isLoading
                          ? null
                          : () async {
                              await controller.createAccount();
                            },
                    );
                  }),
                  SizedBox(height: 50),
                  Center(
                    child: CustomText(
                      text: "have_account".tr,
                      fontSize: 14,
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        await Get.off(() => LoginScreen());
                        Get.find<RegisterController>().onClose();
                      },
                      child: Column(
                        children: [
                          CustomText(
                            text: "login_button".tr.toUpperCase(),
                            color: k_primaryColor,
                            fontSize: 14,
                            letterSpacing: 2,
                          ),
                          SizedBox(height: 2),
                          Container(
                            width: 30,
                            height: 1.5,
                            color: k_primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
