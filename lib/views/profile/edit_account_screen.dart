import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/components/build_image.dart';
import 'package:travel_app/components/custom_button.dart';
import 'package:travel_app/components/custom_field.dart';
import 'package:travel_app/components/custom_text.dart';
import 'package:get/get.dart';
import 'package:travel_app/controllers/profile/edit_account_controller.dart';
import 'package:travel_app/helpers/constants.dart';
import 'package:travel_app/helpers/enum_helper.dart';
import 'package:travel_app/helpers/main_user.dart';
import 'package:travel_app/helpers/validator_helper.dart';

class EditAccountScreen extends GetWidget<EditAccountController> {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: "Edit Account".tr,
          fontSize: 20,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      GetBuilder<EditAccountController>(builder: (_) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: BuildImage(
                            image: controller.image != null
                                ? controller.image!.path
                                : MainUser.instance.model!.image!,
                            width: 120,
                            height: 120,
                            isNetworkImage: controller.image != null ? false : true,
                          ),
                        );
                      }),
                      // Image.asset(controller.image!.path),
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: CustomText(
                                text: "Choosing picture from :".tr,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomButton(
                                    text: "Gallery".tr,
                                    onPressed: () {
                                      controller.pickImage(ImageSource.gallery);
                                    },
                                  ),
                                  SizedBox(height: 30),
                                  CustomButton(
                                    text: "Camera".tr,
                                    onPressed: () {
                                      controller.pickImage(ImageSource.camera);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: CustomText(
                          text: "Change Profile Picture".tr,
                          color: k_primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: " " + "Name".tr,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                CustomField(
                  hint: "Name".tr,
                  controller: controller.name,
                  validator: (value) {
                    return ValidatorHelper.instance.validator(value: value, type: FieldType.name);
                  },
                ),
                SizedBox(height: 15),
                CustomText(
                  text: " " + "Location".tr,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                CustomField(
                  hint: "Location".tr,
                  controller: controller.location,
                ),
                SizedBox(height: 15),
                CustomText(
                  text: " " + "Address".tr,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                CustomField(
                  hint: "Address".tr,
                  controller: controller.address,
                ),
                SizedBox(height: 15),
                CustomText(
                  text: " " + "Phone Number".tr,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                CustomField(
                  hint: "Phone Number".tr,
                  controller: controller.phoneNumbner,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return ValidatorHelper.instance
                        .validator(value: value, type: FieldType.phoneNumber);
                  },
                ),
                SizedBox(height: 30),
                Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: "Save Changes".tr,
                    onPressed: controller.isLoading
                        ? null
                        : () {
                            controller.onSubmit();
                          },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
